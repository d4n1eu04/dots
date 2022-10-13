local home = os.getenv("HOME")

local _M = {
  terminal = "alacritty",
  editor = os.getenv("EDITOR") or "nvim",
  browser = "brave",
  modkey = "Mod4"
}

return _M
