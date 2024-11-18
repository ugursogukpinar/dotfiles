-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "catppuccin-frappe"
config.font = wezterm.font("Hack Nerd Font")
config.font_size = 15
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.launch_menu = {}
-- and finally, return the configuration to wezterm

return config
