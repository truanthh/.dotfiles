-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()
local act = wezterm.action
-- This is where you actually apply your config choices
-- -KSDJFLSKDJF

config.window_decorations = "TITLE | RESIZE | INTEGRATED_BUTTONS"

config.font = wezterm.font("Monaspace Neon NF")
-- config.window_decorations = "NONE"

-- For example, changing the color scheme:
-- config.color_scheme = 'Bamboo'

-- config.enable_tab_bar = true
config.enable_tab_bar = false
-- config.hide_tab_bar_if_only_one_tab = true

config.colors = {
  ansi = {
    'black',
    'maroon',
    'green',
    'olive',
    'navy',
    'purple',
    'teal',
    'silver',
    },
  brights = {
    'grey',
    'red',
    '#5f9E9D', -- 'lime',
    '#cfa500', -- 'yellow',
    'blue',
    'fuchsia',
    'aqua',
    'white',
  },
	-- The default text color
	foreground = "#2E3440",
	-- The default background color
	background = "#F7F8FA",
}

config.keys = {
	{ key = "Slash", mods = "CTRL", action = wezterm.action({ SendString = "\x1f" }) },
	{ key = "l", mods = "ALT", action = wezterm.action({ ActivateTabRelative = 1 }) },
	{ key = "h", mods = "ALT", action = wezterm.action({ ActivateTabRelative = -1 }) },
	{ key = "t", mods = "ALT", action = act.SpawnTab("DefaultDomain") },
}

config.initial_cols = 140
config.initial_rows = 40

config.font_size = 16

-- and finally, return the configuration to wezterm
return config
