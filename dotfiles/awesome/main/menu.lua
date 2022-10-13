local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget

local beautiful = require("beautiful")

local M = {} --menu table
local _M = {} --module table

local terminal = RC.vars.terminal
local browser = RC.vars.browser
local internet = "iwctl"
local files = "thunar"
local sound = "pulsemixer"
local editor = os.getenv("EDITOR") or "nvim"
local editor_cmd = terminal .. " -e " .. editor

M.awesome = {
  { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "restart", awesome.restart },
  { "quit", function() awesome.quit() end },
}

function _M.get()
  local menu_items = {
    { "Awesome", M.awesome, beautiful.awesome_subicon },
    { "Terminal", terminal },
    { "🦁 Navegador", browser },
    { "🌐 Internet", terminal .. " -e " .. internet },
    { "🔉 Sound", terminal .. " -e " .. sound },
    { "📁 Arquivos", files }
  }
  return menu_items
end

return setmetatable(
  {},
  { __call = function(_, ...) return _M.get(...) end }
)
