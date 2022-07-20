local wezterm = require 'wezterm'

return {
  -- Window, layout
  window_decorations = "NONE",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
  },
  window_frame = {
    active_titlebar_bg = '#282828',
    inactive_titlebar_bg = '#282828'
  },
  hide_tab_bar_if_only_one_tab = true,
  
  -- Fonts
  font = wezterm.font('FiraCode Nerd Font', {weight = 'Regular'}),
  font_size = 14,
  font_rules = {
    {
      italic = true,
      font = wezterm.font('VictorMono Nerd Font', {
        weight = 'DemiBold',
        italic = true
      }) 
    }
  },

  -- Colors
  color_scheme = "gruvbox",
  color_schemes = {
    gruvbox = {
      foreground = "#ebdbb2",
      background = "#282828",
      cursor_bg = "#928374",
      cursor_border = "#ebdbb2",
      cursor_fg = "#282828",
      selection_bg = "#ebdbb2" ,
      selection_fg = "#3c3836",

      ansi = {
        "#282828", -- black
        "#cc241d", -- red
        "#98971a", -- green
        "#d79921", -- yellow
        "#458588", -- blue
        "#b16286", -- purple
        "#689d6a", -- aqua 
        "#a89984"  -- gray
      },

      brights = {
        "#7c6f64", -- black
        "#fb4934", -- red
        "#b8bb26", -- green
        "#fabd2f", -- yellow
        "#83a598", -- blue
        "#d3869b", -- purple
        "#8ec07c", -- aqua
        "#fbf1c7"  -- gray
      }
    }
  },

  -- Keybinds
  keys = {
    {
      key = "h",
      mods = "CTRL | SHIFT",
      -- Previous tab
      action = wezterm.action{ActivateTabRelative = -1}
    },
    {
      key = "l",
      mods = "CTRL | SHIFT",
      -- Next tab
      action = wezterm.action{ActivateTabRelative = 1}
    },
    {
      key = "j",
      mods = "CTRL | SHIFT",
      -- Scroll down
      action = wezterm.action{ScrollByLine = 1}
    },
    {
      key = "k",
      mods = "CTRL | SHIFT",
      -- Scroll up
      action = wezterm.action{ScrollByLine = -1}
    },
  }
}
