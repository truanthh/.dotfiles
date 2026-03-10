-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.font = wezterm.font("Monaspace Neon NF")
-- config.font = wezterm.font("CaskaydiaCove NF")

-- For example, changing the color scheme:
-- config.color_scheme = 'Bamboo'

-- enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true

config.colors = {
	-- The default text color
	foreground = "#2E3440",
	-- The default background color
	background = "#F7F8FA",
}

config.keys = {
	{ key = "Slash", mods = "CTRL", action = wezterm.action({ SendString = "\x1f" }) },
	{ key = "l", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTabRelative = 1 }) },
	{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTabRelative = -1 }) },
}

config.initial_cols = 140
config.initial_rows = 40

config.font_size = 16

-- and finally, return the configuration to wezterm
return config
