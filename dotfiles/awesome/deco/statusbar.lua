-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Wibox handling library
local wibox            = require("wibox")
local beautiful        = require("beautiful")
-- Custom Local Library: Common Functional Decoration
local deco             = {
  wallpaper = require("deco.wallpaper"),
  taglist   = require("deco.taglist"),
  tasklist  = require("deco.tasklist")
}
--widgets library
local lain             = require("lain")
local battery_widget   = require("awesome-wm-widgets.battery-widget.battery")
local icon_sound       = "/usr/share/icons/Fluent-red-dark/symbolic/status/audio-volume-high-symbolic.svg"
local volume_widget    = require("awesome-wm-widgets.volume-widget.volume")
local separator        = wibox.widget.textbox(" / ")
local spacer           = wibox.widget.textbox(" ")
local taglist_buttons  = deco.taglist()
local tasklist_buttons = deco.tasklist()

--xresources for color
local xresources = require("beautiful.xresources")
local xrdb = xresources.get_current_theme()

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Wibar
-- Creating widgets
mytextclock = wibox.widget.textclock()
volumewidget = lain.widget.pulse {
  settings = function()
    vlevel = volume_now.channel[1]
    if volume_now.muted == "yes" then
      vlevel = vlevel .. " M"
    end
    widget:set_markup(lain.util.markup(xrdb.color14, " " .. vlevel .. "🔊 "))
  end
}

awful.screen.connect_for_each_screen(function(s)
  -- Wallpaper
  set_wallpaper(s)

  -- Create a promptbox for each screen
  s.mypromptbox = awful.widget.prompt()

  -- Create an imagebox widget which will contain an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  s.mylayoutbox = awful.widget.layoutbox(s)
  s.mylayoutbox:buttons(gears.table.join(
    awful.button({}, 1, function() awful.layout.inc(1) end),
    awful.button({}, 3, function() awful.layout.inc(-1) end),
    awful.button({}, 4, function() awful.layout.inc(1) end),
    awful.button({}, 5, function() awful.layout.inc(-1) end)
  ))

  -- Create a taglist widget
  s.mytaglist = awful.widget.taglist {
    screen  = s,
    filter  = awful.widget.taglist.filter.all,
    buttons = taglist_buttons
  }

  -- Create a tasklist widget
  s.mytasklist = awful.widget.tasklist {
    screen  = s,
    filter  = awful.widget.tasklist.filter.focused,
    buttons = tasklist_buttons
  }

  -- Create the wibox
  s.mywibox = awful.wibar({ position = "top", screen = s, border_width = 4, opacity = 0.75,
    shape = gears.shape.rounded })

  -- Add widgets to the wibox
  s.mywibox:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
      layout = wibox.layout.fixed.horizontal,
      RC.launcher,
      s.mytaglist,
      s.mypromptbox,
    },
    s.mytasklist, -- Middle widget
    { -- Right widgets
      layout = wibox.layout.fixed.horizontal,
      wibox.widget.systray(),
      mytextclock,
      separator,
      battery_widget(),
      separator,
      volume_widget {
        widget_type = "icon_and_text",
        icon_dir = "/usr/share/icons/Fluent-red-dark/symbolic/status/",
        font = "SpaceMonoNerdFont 8"
      },
      spacer,
      s.mylayoutbox,
    },
  }
end)
-- }}}
