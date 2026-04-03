{ config, pkgs, ... }:

let
  username = "zap";
in {
  imports = [
    ./niri.nix
    ./kitty.nix
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [ "networkmanager" "wheel" "video" "libvirtd" ];
    packages = with pkgs; [];
  };

  # Enable flake
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    git zip unzip wget file
    man-pages man-pages-posix
    distrobox
    bibata-cursors
  ];

  # Auto login
  services.greetd = let 
    tuigreet = "${pkgs.tuigreet}/bin/tuigreet";
    session = "${config.programs.niri.package}/bin/niri-session";
  in {
    enable = true;
    settings = {
      initial_session = {
        command = session;
        user = username;
      };
      default_session = {
        command = /*sh*/ ''
          ${tuigreet} --greeting 'Welcome to NixOS!' --asterisks --time
            --remember --remember-user-session -cmd ${session}
        '';
        user = "greeter";
      };
    };
  };

  services.flatpak.enable = true;
  documentation.dev.enable = true;

  # Enable Pipewire (multimedia codecs)
  # <https://nixos.wiki/wiki/PipeWire>
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Virtualization
  programs.virt-manager.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
    };
    libvirtd = {
      enable = true;
      qemu.vhostUserPackages = [ pkgs.virtiofsd ];
    };
    spiceUSBRedirection.enable = true;
  };

  programs.hyprlock.enable = true;
}
