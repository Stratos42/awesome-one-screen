-------------------------------
--  "Stratos Dark" awesome theme  --
--    By Stratos (epitech)  --
-------------------------------

require("color")

-- {{{ Main
theme = {}
--theme.wallpaper_cmd = { "awsetbg /home/" .. USER .. "/.config/awesome/themes/wallpaper/space_wallpaper_1280x1024.jpg" }
theme.wallpaper_cmd = { "nitrogen --set-scaled /home/" .. USER .. "/.config/awesome/themes/wallpaper/Chimera1600x1200.jpg" }

theme.font = "terminus 8.5"

theme.bg_normal = trblk
theme.bg_focus = trblk
theme.bg_urgent = red
theme.bg_minimize = trblk

theme.fg_normal = brblk
theme.fg_focus = yel
theme.fg_urgent = trwhi
theme.fg_minimize = blk

theme.border_width = "1"
theme.border_normal = trblk
theme.border_focus = brblk
theme.border_marked = blu
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#5C5C5C"
theme.titlebar_bg_normal = "#0C0C0C"
-- }}}

-- {{{ Widgets
theme.fg_widget        = brblk
theme.fg_center_widget = brblk
theme.fg_end_widget    = brblk
theme.bg_widget        = trblk
theme.border_widget    = trblk
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = "20"
theme.menu_width  = "150"
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = "/usr/share/awesome/themes/zenburn/taglist/squarefz.png"
theme.taglist_squares_unsel = "/usr/share/awesome/themes/zenburn/taglist/squarez.png"
-- }}}

-- {{{ Misc
theme.awesome_icon           = "/usr/share/awesome/themes/zenburn/awesome-icon.png"
theme.gentoo_icon	     = "/home/" .. USER .. "/.config/awesome/themes/dark/pictures/gentoo_logo.png"
theme.cpu_icon		     = "/home/" .. USER .. "/.config/awesome/themes/dark/pictures/cpu_icon.jpg"
theme.temp_icon	             = "/home/" .. USER .. "/.config/awesome/themes/dark/pictures/temp_icon.jpg"
-- }}}

-- {{{ Layout
theme.layout_fairh           = "/usr/share/awesome/themes/sky/layouts/fairh.png"
theme.layout_fairv           = "/usr/share/awesome/themes/sky/layouts/fairv.png"
theme.layout_floating        = "/usr/share/awesome/themes/sky/layouts/floating.png"
theme.layout_magnifier       = "/usr/share/awesome/themes/sky/layouts/magnifier.png"
theme.layout_max             = "/usr/share/awesome/themes/sky/layouts/max.png"
theme.layout_fullscreen      = "/usr/share/awesome/themes/sky/layouts/fullscreen.png"
theme.layout_tilebottom      = "/usr/share/awesome/themes/sky/layouts/tilebottom.png"
theme.layout_tileleft        = "/usr/share/awesome/themes/sky/layouts/tileleft.png"
theme.layout_tile            = "/usr/share/awesome/themes/sky/layouts/tile.png"
theme.layout_tiletop         = "/usr/share/awesome/themes/sky/layouts/tiletop.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = "/usr/share/awesome/themes/zenburn/titlebar/close_focus.png"
theme.titlebar_close_button_normal = "/usr/share/awesome/themes/zenburn/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = "/usr/share/awesome/themes/zenburn/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = "/usr/share/awesome/themes/zenburn/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = "/usr/share/awesome/themes/zenburn/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = "/usr/share/awesome/themes/zenburn/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme
