pcall(require, "luarocks.loader")

--awesome libraries
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")
awful.spawn("pulseaudio")
--variables
RC = {}
RC.vars = require("main.uservariables")

--language
os.setlocale(os.getenv("LANG"))


--error handling
require("main.errorhandling")


-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init("/home/daniell/.config/awesome/xresources/theme.lua")
-- }}}
modkey = RC.vars.modkey

local main = {
  layouts = require("main.layouts"),
  tags = require("main.tags"),
  menu = require("main.menu"),
  rules = require("main.rules")
}

local binding = {
  globalbuttons = require("binding.globalbuttons"),
  clientbuttons = require("binding.clientbuttons"),
  globalkeys = require("binding.globalkeys"),
  clientkeys = require("binding.clientkeys"),
  bindtotags = require("binding.bindtotags")
}

--layouts
RC.layouts = main.layouts()

--tags
RC.tags = main.tags()

--menu
RC.mainmenu = awful.menu({ items = main.menu() })
RC.launcher = awful.widget.launcher(
  { image = beautiful.awesome_icon, menu = RC.mainmenu }
)

menubar.utils.terminal = RC.vars.terminal

--mouse/key binding
RC.globalkeys = binding.globalkeys()
RC.globalkeys = binding.bindtotags(RC.globalkeys)

--set root
root.buttons(binding.globalbuttons())
root.keys(RC.globalkeys)

mykeyboardlayout = awful.widget.keyboardlayout()


--statusbar
require("deco.statusbar")

--rules
awful.rules.rules = main.rules(
  binding.clientkeys(),
  binding.clientbuttons()
)

--signals
require("main.signals")

--autostarts
awful.spawn("xbindkeys")
awful.spawn("picom --experimental-backends --backend glx")
awful.spawn("wal -i Imagens/Wallpapers/rrbltiehz7b31.png --backend wal -b 1c1c1c --saturate 0.79 -a 0.5 -n")
