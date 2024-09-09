-- Get the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Font settings
config.font = wezterm.font("CommitMono Nerd Font", { weight = "DemiBold" })
config.font_size = 14
config.line_height = 1.3

-- Top bar settings
config.hide_tab_bar_if_only_one_tab = true

-- Background

local dimmer = { brightness = 0.075 }

config.background = {
	-- This is the deepest/back-most layer. It will be rendered first
	{
		source = {
			File = wezterm.config_dir .. "/kanagawa-dark.png",
		},

		width = "100%",
		height = "100%",
		-- The texture tiles vertically but not horizontally.
		-- When we repeat it, mirror it so that it appears "more seamless".
		-- An alternative to this is to set `width = "100%"` and have
		-- it stretch across the display
		repeat_x = "NoRepeat",
		repeat_y = "NoRepeat",
		hsb = dimmer,
		-- When the viewport scrolls, move this layer 10% of the number of
		-- pixels moved by the main viewport. This makes it appear to be
		-- further behind the text.
		attachment = { Parallax = 0 },
	},
}

-- For example, changing the color scheme:
-- config.color_scheme = "Catppuccin Latte (Gogh)"
config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "Kanagawa Dragon (Gogh)"
-- config.color_scheme = "Gruvbox (Gogh)"
-- config.colors = require("cyberdream")
-- config.colors = require("cyberdream-light")
-- config.colors = require("Kanagawa-lotus")

config.window_background_opacity = 0.85
config.macos_window_background_blur = 30

-- and finally, return the configuration to wezterm
return config
