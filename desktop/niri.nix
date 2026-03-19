{ config, pkgs, ... }:

let
  luaWriter = pkgs.writers.makeScriptWriter {
    interpreter = "${pkgs.luajit}/bin/luajit";
    check = "${pkgs.luajitPackages.luacheck}/bin/luacheck";
  };

  powermenu = luaWriter "powermenu.lua" /*lua*/ ''
local lock = "hyprlock -c ${./hyprlock/hyprlock.conf}"

local options = {
  {
    name = "Sleep",
    icon = "system-suspend",
    commands = { lock, "systemctl suspend" },
  },
  {
    name = "Shut down",
    icon = "system-shutdown",
    commands = { "systemctl poweroff" },
  },
  {
    name = "Restart",
    icon = "system-reboot",
    commands = { "systemctl reboot" },
  },
  {
    name = "Lock",
    icon = "system-lock-screen",
    commands = { lock },
  },
  {
    name = "Log out",
    icon = "system-log-out",
    commands = { "niri msg action quit -s" },
  }
}

for _, opt in ipairs(options) do
  if arg[1] then
    if opt.name == arg[1] then
      for _, command in ipairs(opt.commands) do
        os.execute(command..' > /dev/null 2>&1 &')
      end
    end
  else
    print(opt.name..'\0icon\x1f'..opt.icon)
  end
end
  '';

  rofiConfig = pkgs.writeText "config" /*rasi*/ ''
configuration {
  application-fallback-icon: "run-build";
  combi-modi: "drun,run";
  disable-history: false;
  display-drun: "󱓞 Apps";
  display-filebrowser: " Files";
  display-powermenu: " Power";
  display-run: " Run";
  display-ssh: "󰀂 SSH";
  drun-display-format: " {name} ";
  location: 0;
  matching: "fuzzy";
  me-accept-entry: "MousePrimary";
  me-select-entry: "";
  modi: "drun,run,ssh,filebrowser,powermenu:${powermenu}";
  scroll-method: 0;
  show-icons: true;
  sidebar-mode: true;
  sort: true;
  sorting-method: "fzf";
  ssh-command: "${pkgs.kitty}/bin/kitty kitten ssh {host}";
  terminal: "${pkgs.kitty}/bin/kitty";
  xoffset: 0;
  yoffset: 0;
}
@theme "${./rofi/theme.rasi}"
  '';

  rofi = ''"${pkgs.rofi}/bin/rofi" "-config" "${rofiConfig}"'';

  waybarConfig = pkgs.writeText "config" /*json*/ ''
{
  "layer": "top",
  "backlight": {
    "format": "{percent}% {icon}",
    "format-icons": [
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      "",
      ""
    ],
    "on-scroll-down": "${pkgs.brightnessctl}/bin/brightnessctl set 1%-",
    "on-scroll-up": "${pkgs.brightnessctl}/bin/brightnessctl set 1%+"
  },
  "battery": {
    "format": "{capacity}% {icon}",
    "format-alt": "{time} {icon}",
    "format-charging": "{capacity}% 󰢝",
    "format-icons": [
      "",
      "",
      "",
      "",
      ""
    ],
    "format-plugged": "{capacity}% ",
    "states": {
      "critical": 15,
      "warning": 30
    }
  },
  "clock": {
    "format": "{:%b %d(%H:%M) 󰃰}",
    "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>"
  },
  "modules-left": [ "niri/workspaces", "niri/window" ],
  "modules-right": [
    "pulseaudio",
    "backlight",
    "network",
    "battery",
    "clock"
  ],
  "network": {
    "format": "{ifname}",
    "format-disconnected": "Disconnected 󱛅",
    "format-ethernet": "{ipaddr}/{cidr} 󰈀",
    "format-wifi": "Connected ",
    "max-length": 50,
    "tooltip-format": "{ifname} via {gwaddr} 󰛳",
    "tooltip-format-disconnected": "Disconnected",
    "tooltip-format-ethernet": "{ifname} ",
    "tooltip-format-wifi": "{essid} ({signalStrength}%) "
  },
  "pulseaudio": {
    "format": "{volume}% {icon} {format_source}",
    "format-bluetooth": "{volume}% {icon} {format_source}",
    "format-bluetooth-muted": "󰝟 {icon} {format_source}",
    "format-icons": {
      "car": "",
      "default": [
        "",
        "",
        ""
      ],
      "hands-free": "󱠰",
      "headphone": "",
      "headset": "󰋎",
      "phone": "",
      "portable": ""
    },
    "format-muted": "󰝟 {format_source}",
    "format-source": "{volume}% ",
    "format-source-muted": "",
    "on-click": "${pkgs.pavucontrol}/bin/pavucontrol"
  }
}
  '';
  niriConfig = pkgs.writeText "config.kdl" /*kdl*/ ''
input {
  keyboard {
    xkb {
      options "ctrl:nocaps"
    }
  }

  touchpad {
    tap
    natural-scroll
  }

  touch {
    off
  }
}

cursor {
  xcursor-theme "Bibata-Modern-Classic"
  xcursor-size 24
}

output "eDP-1" {
  scale 1
  transform "normal"
}

layout {
  // background-color "transparent"
  gaps 6

  center-focused-column "never"
  default-column-width { proportion 0.5; }

  focus-ring {
    off
  }

  border {
    width 3
    active-color "#ebdbb2"
    inactive-color "#3C3836"
    urgent-color "#fb4934"
  }
}

animations {
  workspace-switch {
    spring damping-ratio=1.0 stiffness=4000 epsilon=0.0001
  }
}

hotkey-overlay {
  skip-at-startup
}

// This line starts waybar, a commonly used bar for Wayland compositors.
spawn-at-startup "${pkgs.waybar}/bin/waybar" "-c" "${waybarConfig}" "-s" "${./waybar/waybar.css}"
spawn-at-startup "${pkgs.swaybg}/bin/swaybg" "-i" "${./res/wallpaper.png}"

prefer-no-csd
screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"

window-rule {
  geometry-corner-radius 8
  clip-to-geometry true
}

window-rule {
  match is-floating=true

  shadow {
    on
  }
}

layer-rule {
  match namespace="^rofi$"
  geometry-corner-radius 10
  shadow {
    on
  }
}

overview {
  zoom 0.75
  backdrop-color "#458588"
}

binds {
  // Suggested binds for running programs: terminal, app launcher, screen locker.
  Mod+Return       hotkey-overlay-title="Open a Terminal: kitty"         { spawn "${pkgs.kitty}/bin/kitty"; }
  Mod+Shift+Return hotkey-overlay-title="Run an Application: rofi"       { spawn ${rofi} "-show" "drun"; }
  Mod+B            hotkey-overlay-title="Open the web browser: firefox"  { spawn "firefox"; }
  Mod+Shift+B      hotkey-overlay-title="Open the web browser (private)" { spawn "firefox" "--private-window"; }
  Mod+Q            hotkey-overlay-title="Open the power menu: rofi"      { spawn ${rofi} "-show" "powermenu"; }
  Mod+E            hotkey-overlay-title="Open the file browser: rofi"    { spawn ${rofi} "-show" "filebrowser"; }
  Mod+Z            hotkey-overlay-title="Lock the Screen: hyprlock"      { spawn "hyprlock" "-c" "${./hyprlock/hyprlock.conf}"; }

  // Example volume keys mappings for PipeWire & WirePlumber.
  // The allow-when-locked=true property makes them work even when the session is locked.
  XF86AudioRaiseVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+"; }
  XF86AudioLowerVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-"; }
  XF86AudioMute        allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
  XF86AudioMicMute     allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"; }
  XF86AudioNext        allow-when-locked=true { spawn "playerctl" "next"; }
  XF86AudioPrev        allow-when-locked=true { spawn "playerctl" "previous"; }
  XF86AudioPlay        allow-when-locked=true { spawn "playerctl" "play-pause"; }

  XF86MonBrightnessUp   allow-when-locked=true { spawn "${pkgs.brightnessctl}/bin/brightnessctl" "set" "5%+"; }
  XF86MonBrightnessDown allow-when-locked=true { spawn "${pkgs.brightnessctl}/bin/brightnessctl" "set" "5%-"; }

  Mod+Comma  allow-when-locked=true { spawn "playerctl" "previous"; }
  Mod+Period allow-when-locked=true { spawn "playerctl" "next"; }
  Mod+Slash  allow-when-locked=true { spawn "playerctl" "play-pause"; }

  Mod+O repeat=false { toggle-overview; }

  Mod+W { close-window; }

  Mod+H { focus-column-left; }
  Mod+J { focus-window-down; }
  Mod+K { focus-window-up; }
  Mod+L { focus-column-right; }

  Mod+WheelScrollDown { focus-workspace-down; }
  Mod+WheelScrollUp   { focus-workspace-up; }

  Mod+Shift+H { move-column-left; }
  Mod+Shift+J { move-window-down; }
  Mod+Shift+K { move-window-up; }
  Mod+Shift+L { move-column-right; }

  Mod+1 { focus-workspace 1; }
  Mod+2 { focus-workspace 2; }
  Mod+3 { focus-workspace 3; }
  Mod+4 { focus-workspace 4; }
  Mod+5 { focus-workspace 5; }
  Mod+6 { focus-workspace 6; }
  Mod+7 { focus-workspace 7; }
  Mod+8 { focus-workspace 8; }
  Mod+9 { focus-workspace 9; }
  Mod+0 { focus-workspace 10; }
  Mod+Shift+1 { move-column-to-workspace 1; }
  Mod+Shift+2 { move-column-to-workspace 2; }
  Mod+Shift+3 { move-column-to-workspace 3; }
  Mod+Shift+4 { move-column-to-workspace 4; }
  Mod+Shift+5 { move-column-to-workspace 5; }
  Mod+Shift+6 { move-column-to-workspace 6; }
  Mod+Shift+7 { move-column-to-workspace 7; }
  Mod+Shift+8 { move-column-to-workspace 8; }
  Mod+Shift+9 { move-column-to-workspace 9; }
  Mod+Shift+0 { move-column-to-workspace 10; }

  Mod+F { maximize-column; }
  Mod+Shift+F { fullscreen-window; }

  Mod+C { center-column; }

  Mod+Ctrl+H { set-column-width "-6.25%"; }
  Mod+Ctrl+L { set-column-width "+6.25%"; }

  Mod+Shift+Space { toggle-window-floating; }
  Mod+Space       { switch-focus-between-floating-and-tiling; }

  Mod+P       { screenshot; }
  Mod+Shift+P { screenshot-screen; }
  Mod+Alt+P   { screenshot-window; }

  Mod+Escape allow-inhibiting=false { toggle-keyboard-shortcuts-inhibit; }
}
  '';
in {
  environment.sessionVariables = {
    NIRI_CONFIG = niriConfig;
  };

  programs.niri.enable = true;
  services.playerctld.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.roboto-mono
  ];
}
