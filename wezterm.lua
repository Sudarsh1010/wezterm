-- Get the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
-- Set powershell.exe (or pwsh.exe) as default on start
config.default_prog = { "powershell.exe" } -- if on windows 10 replace for 'pwsh.exe'

-- Font settings
config.font = wezterm.font("GeistMono Nerd Font", { weight = "DemiBold" })
config.font_size = 12.5
config.line_height = 1.3

-- Top bar settings
config.hide_tab_bar_if_only_one_tab = true

-- Background

local dimmer = { brightness = 0.085 }

config.background = {
	-- This is the deepest/back-most layer. It will be rendered first
	{
		source = {
			File = wezterm.config_dir .. "/vagabound.jpeg",
		},

		width = "100%",
		-- The texture tiles vertically but not horizontally.
		-- When we repeat it, mirror it so that it appears "more seamless".
		-- An alternative to this is to set `width = "100%"` and have
		-- it stretch across the display
		repeat_x = "NoRepeat",
		hsb = dimmer,
		-- When the viewport scrolls, move this layer 10% of the number of
		-- pixels moved by the main viewport. This makes it appear to be
		-- further behind the text.
		attachment = { Parallax = 0.1 },
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

-- and finally, return the configuration to wezterm
return config
