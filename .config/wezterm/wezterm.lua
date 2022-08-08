-- +----------------------------+
-- | WezTerm Configuration file |
-- +----------------------------+

local wezterm = require 'wezterm'

local pad = 0

local font_normal = {
  family = 'FiraCode Nerd Font',
  weight = 'Regular',
  italic = false
}

local font_italic = {
  family = 'VictorMono Nerd Font',
  weight = 'DemiBold',
  italic = true
}

function load_font(font)
  return wezterm.font(font.family, {
    weight = font.weight,
    italic = font.italic
  })
end

return {
  -- Window, layout
  window_padding = {
    left = pad,
    right = pad,
    top = pad,
    bottom = pad
  },
  window_frame = {
    active_titlebar_bg = '#3c3836',
    inactive_titlebar_bg = '#3c3836'
  },
  hide_tab_bar_if_only_one_tab = true,
  
  -- Fonts
  font = load_font(font_normal),
  font_size = 12,
  font_rules = {
    {
      italic = true,
      font = load_font(font_italic) 
    }
  },

  -- Colors
  color_scheme = 'gruvbox',
  color_schemes = {
    gruvbox = {
      foreground = '#ebdbb2',
      background = '#282828',
      cursor_bg = '#928374',
      cursor_border = '#ebdbb2',
      cursor_fg = '#282828',
      selection_bg = '#ebdbb2' ,
      selection_fg = '#3c3836',

      ansi = {
        '#282828', -- black
        '#cc241d', -- red
        '#98971a', -- green
        '#d79921', -- yellow
        '#458588', -- blue
        '#b16286', -- purple
        '#689d6a', -- aqua 
        '#ebdbb2'  -- white
      },

      brights = {
        '#928374', -- black
        '#fb4934', -- red
        '#b8bb26', -- green
        '#fabd2f', -- yellow
        '#83a598', -- blue
        '#d3869b', -- purple
        '#8ec07c', -- aqua
        '#fbf1c7'  -- white
      }
    }
  },

  -- Keybinds
  keys = {
    {
      key = 'h',
      mods = 'CTRL | SHIFT',
      -- Previous tab
      action = wezterm.action{ActivateTabRelative = -1}
    },
    {
      key = 'l',
      mods = 'CTRL | SHIFT',
      -- Next tab
      action = wezterm.action{ActivateTabRelative = 1}
    },
    {
      key = 'j',
      mods = 'CTRL | SHIFT',
      -- Scroll down
      action = wezterm.action{ScrollByLine = 1}
    },
    {
      key = 'k',
      mods = 'CTRL | SHIFT',
      -- Scroll up
      action = wezterm.action{ScrollByLine = -1}
    },
  }
}
