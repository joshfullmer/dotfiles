local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Tokyo Night Moon"

config.font = wezterm.font("MonaspiceAr Nerd Font Propo")
config.font_size = 14

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.35
config.macos_window_background_blur = 10

return config
