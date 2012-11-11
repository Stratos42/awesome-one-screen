-----------------------------------------
--    rc.lua for awesome-one-screen    --
--    by Aurelien Frances (Stratos)    --
--         dev@aufrinfo.net            --
-----------------------------------------

-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
require("awful.remote")

-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")

-- Load vicious
require("vicious")
require("calendar2")

-- {{{ Variable definitions
-- Modify this line before restart awesome
USER            =       os.getenv("USER")

-- Themes define colours, icons, and wallpapers
beautiful.init("/home/" .. USER .. "/.config/awesome/themes/dark/theme.lua")

-- notifications
naughty.config.default_preset.timeout          = 5
naughty.config.default_preset.screen           = 1
naughty.config.default_preset.position         = "top_right"
naughty.config.default_preset.margin           = 4
naughty.config.default_preset.height           = 20
naughty.config.default_preset.width            = 350
naughty.config.default_preset.gap              = 1
naughty.config.default_preset.ontop            = true
naughty.config.default_preset.font             = beautiful.font or "Verdana 8"
naughty.config.default_preset.icon             = nil
naughty.config.default_preset.icon_size        = 16
naughty.config.default_preset.fg               = trwhi --beautiful.fg_focus or '#ffffff'
naughty.config.default_preset.bg               = red --beautiful.bg_focus or '#535d6c'

-- This is used later as the default terminal and editor to run.
terminal        =       "xterm"
chromium        =       "chromium-browser"
zlock		=	"zlock -immed"
firefox         =       "firefox"
editor          =       "emacs -nw"
editor_cmd      =       "xterm -e " .. editor
mc_cmd          =       "xterm -e mc"
halt            =       "sudo /sbin/halt"
reboot          =       "sudo /sbin/reboot"
pidgin          =       "pidgin"

-- Default modkey.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
   {
   awful.layout.suit.floating,
   awful.layout.suit.tile,
   -- awful.layout.suit.tile.left,
   awful.layout.suit.tile.bottom,
   -- awful.layout.suit.tile.top,
   awful.layout.suit.fair,
   -- awful.layout.suit.fair.horizontal,
   -- awful.layout.suit.spiral,
   -- awful.layout.suit.spiral.dwindle,
   -- awful.layout.suit.max,
   -- awful.layout.suit.max.fullscreen,
   awful.layout.suit.magnifier
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags =
   {
   names = { "[sys]", "[misc]", "[dev1]", "[dev2]", "[web]", "[dev3]", "[msg]" },
   layout = { layouts[1], layouts[1], layouts[2], layouts[2], layouts[1], layouts[2], layouts[2] }
}
tags[1] = awful.tag(tags.names, 1, tags.layout)
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu =
   {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
   { "restart", awesome.restart }
}

mymainmenu = awful.menu(
   {
      items =
         {
         { "awesome", myawesomemenu, beautiful.gentoo_icon },
         { "mid-commander", mc_cmd },
         { "" },
         { "logout", awesome.quit },
         { "shutdown", halt },
         { "reboot", reboot }
      }
   })

mylauncher = awful.widget.launcher(
   {
      image = image(beautiful.gentoo_icon),
      menu = mymainmenu
   })
awful.widget.layout.margins[mylauncher] = { left = 2, right = 5 }

-- {{{ Wibox
-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox1 = {}
mywibox2 = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
   awful.button({        }, 1, awful.tag.viewonly),
   awful.button({ modkey }, 1, awful.client.movetotag),
   awful.button({        }, 3, awful.tag.viewtoggle),
   awful.button({ modkey }, 3, awful.client.toggletag),
   awful.button({        }, 4, awful.tag.viewnext),
   awful.button({        }, 5, awful.tag.viewprev)
)
mytasklist = { }
mytasklist.buttons = awful.util.table.join(
   awful.button({ }, 1, function (c)
                           if not c:isvisible() then
                              awful.tag.viewonly(c:tags()[1])
                           end
                           client.focus = c
                           c:raise()
                        end),
   awful.button({ modkey }, 1, function (c) c:kill()
                        end),
   awful.button({ }, 3, function ()
                           if instance then
                              instance:hide()
                              instance = nil
                           else
                              instance = awful.menu.clients({ width=250 })
                           end
                        end),
   awful.button({ }, 4, function ()
                           awful.client.focus.byidx(1)
                           if client.focus then client.focus:raise() end
                        end),
   awful.button({ }, 5, function ()
                           awful.client.focus.byidx(-1)
                           if client.focus then client.focus:raise() end
                        end))

-- CPU widget
cputwidget = widget({ type = "textbox" })
vicious.register(cputwidget, vicious.widgets.cpu,
		 function (widget, args)
		    if  args[1] == 50 then
		       return "| " .. colyel .. "cpu " .. coldef .. colbyel .. args[1] .. "% " .. coldef .. ""
		    elseif args[1] >= 50 then
		       return "| " .. colred .. "cpu " .. coldef .. colbred .. args[1] .. "% " .. coldef .. ""
		    else
		       return "| " .. colblk .. "cpu " .. coldef .. colbblk .. args[1] .. "% " .. coldef .. ""
		    end
		 end )
cputwidget:buttons(awful.util.table.join(awful.button({}, 1, function () awful.util.spawn ( terminal .. " -e htop") end ) ) )

-- Ram widget
memwidget = widget({ type = "textbox" })
vicious.cache(vicious.widgets.mem)
vicious.register(memwidget, vicious.widgets.mem, "" .. colblk .. "ram " .. coldef .. colbblk .. "$1% ($2 MiB) " .. coldef .. "", 59)

-- Sound widget
volwidget = widget({ type = "textbox" })
vicious.register(volwidget, vicious.widgets.volume, "" .. colblk .. "vol " .. coldef .. colbgre .. "$1% " .. coldef .. "", 1, "Master")
volwidget:buttons(awful.util.table.join(awful.button({}, 4, function () awful.util.spawn ( "amixer -c 0 set Master 2dB+" ) end ),
					awful.button({}, 5, function () awful.util.spawn ( "amixer -c 0 set Master 2dB-" ) end ) ) )

-- Gmail widget
mailwidget = widget({ type = "textbox" })
vicious.register(mailwidget, vicious.widgets.gmail, "" .. colblk .. "gmail " .. coldef .. colbgre .. "${count} messages" .. coldef .. " | ", 20)

-- Calendar widget
calwidget = widget({ type = "textbox" })
function dayth()
   local osd = os.date("%d")
   if osd == "01" or osd == "21" or osd == "31" then
      return "<span font='proggytiny 7'><sup>st</sup></span>"
   elseif osd == "02" or osd == "22" then
      return "<span font='proggytiny 7'><sup>nd</sup></span>"
   elseif osd == "03" or osd == "23" then
      return "<span font='proggytiny 7'><sup>rd</sup></span>"
   else
      return "<span font='proggytiny 7'><sup>th</sup></span>"
   end
end
vicious.register(calwidget, vicious.widgets.date, " | " .. colyel .. " %a, %d" .. dayth() .. " %B, %H:%M " .. coldef .. "")
-- Affiche un calendrier
-- calendar2.addCalendarToWidget(calwidget, "" .. colyel .. "%s" .. coldef .. "")

-- MPD widget
mpdwidget = widget({ type = "textbox" })
vicious.register(mpdwidget, vicious.widgets.mpd,
                 function (widget, args)
                    if   args["{state}"] == "Stop"
		    then
		       return "" .. colblk .. "mpd " .. coldef .. colbred .. "Stop" .. coldef .. " | "
		    elseif args["{state}"] == "Pause"
		    then
		       return "" .. colblk .. "mpd " .. coldef .. colbyel .. "Paused" .. coldef .. " | "
                    else
		       return "" .. colblk .. "mpd " .. coldef .. colbblu .. args["{Artist}"] .. coldef .. " - " .. colbgre .. args["{Title}"] .. coldef .. " | "
                    end
                 end)
mpdwidget:buttons(awful.util.table.join(awful.button({}, 1, function () awful.util.spawn ( "mpc toggle" ) end ),
					awful.button({}, 2, function () awful.util.spawn ( "mpc stop" ) end ),
					awful.button({}, 3, function () awful.util.spawn ( "mpc next" ) end ) ) )

-- Create a promptbox for screen 1
mypromptbox[1] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
-- Create an imagebox widget which will contains an icon indicating which layout we're using.
-- We need one layoutbox per screen.
mylayoutbox[1] = awful.widget.layoutbox(s)
mylayoutbox[1]:buttons(awful.util.table.join(
                          awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                          awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end)))
-- Create a taglist widget
mytaglist[1] = awful.widget.taglist(1, awful.widget.taglist.label.all, mytaglist.buttons)

-- Create a tasklist widget
mytasklist[1] = awful.widget.tasklist(function(c)
                                         return awful.widget.tasklist.label.currenttags(c, 1)
                                      end, mytasklist.buttons)

-- Create the wibox
mywibox1[1] = awful.wibox({ position = "top", screen = 1 })
mywibox2[1] = awful.wibox({ position = "bottom", screen = 1 })

-- Add widget1 to the wibox - order matters
mywibox1[1].widgets = {
   {
      mypromptbox[1],
      layout = awful.widget.layout.horizontal.leftright
   },
   mylayoutbox[1],
   calwidget,
   volwidget,
   mysystray or nil,
   mytasklist[1],
   layout = awful.widget.layout.horizontal.rightleft
}

mywibox2[1].widgets = {
   cputwidget,
   memwidget,
   mailwidget,
   --mpdwidget,
   layout = awful.widget.layout.horizontal.rightleft,
  {
      mylauncher,
      mytaglist[1],
      layout = awful.widget.layout.horizontal.leftright
   }
}
-- end
-- }}}

-- AUTORUN APPS!
-- toutes les appli doivent être definies dans le fichier ci-dessous
awful.util.spawn_with_shell("/home/" .. USER .. "/.config/awesome/app_start.sh")

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "Tab",
        function ()
           awful.client.focus.byidx(1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),

    -- Standard program
    awful.key({			  }, "#127", function () awful.util.spawn("mpc toggle") end),
    awful.key({ modkey,           }, "Return", function () awful.util.spawn("urxvtc") end),
    awful.key({ modkey, "Control" }, "Return", function () awful.util.spawn(terminal) end),
    awful.key({ modkey,           }, "F1", function () awful.util.spawn(pidgin) end),
    awful.key({ modkey,           }, "F2", function () awful.util.spawn(chromium) end),
    awful.key({ modkey,           }, "F3", function () awful.util.spawn(firefox) end),
    awful.key({ modkey,           }, "F5", function () awful.util.spawn(mc_cmd) end),
    awful.key({ modkey,           }, "F12", function () awful.util.spawn(zlock) end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),
    awful.key({ modkey,           }, "r", function () awful.util.spawn('dmenu_run -l 10 -nb "#0C0C0C" -nf "#525252" -sb "#0C0C0C" -sf "#d79b1e"') end),

    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    -- Prompt
    awful.key({ modkey, "Shift"   }, "r",     function () mypromptbox[mouse.screen]:run() end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey,           }, "q",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",      function (c) c.minimized = not c.minimized    end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "Vlc" },
      properties = { floating = true } },
    { rule = { class = "Acroread" },
      properties = { floating = true } },
    { rule = { class = "Conky" },
      properties = { floating = true } },
    { rule = { class = "Skype" },
      properties = { tag = tags[1][8] } },
    { rule = { name = "Okular" },
      properties = {floating = true} },
    { rule = { name = "Gwenview" },
      properties = {floating = true} },
    { rule = { name = "Notes - Notes" },
      properties = {floating = true} },
    { rule = { class = "Chromium" },
      properties = {floating = true, tag = tags[1][5]} },
    { rule = { name = "Firefox" },
      properties = {tag = tags[1][5]} },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
