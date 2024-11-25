local wezterm = require("wezterm")
return {
	color_scheme = "Catppuccin Mocha",
	config.front_end = "WebGpu",
	default_prog = { "zsh" },
	font = wezterm.font("MonoLisa Nerd Font"),
	font_size = 14.0,
	enable_tab_bar = false,
	term = "wezterm",
	local wayland_gnome = require 'wayland_gnome',
	keys = {
		{
			key = "t",
			mods = "SUPER",
			action = wezterm.action.DisableDefaultAssignment,
		},
	},
}
