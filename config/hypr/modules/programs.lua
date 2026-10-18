---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
-- local terminal    = "alacritty"
-- local fileManager = "dolphin"
-- local menu        = "rofi -show drun"


local M = {}

M.terminal    = "alacritty"
M.fileManager = "nautilus -w"   -- nautilus -w | thunar -w
M.rofi        = "rofi -show drun"
-- M.applauncher = "qs ipc call applauncher toggle"
M.applauncher = "noctalia msg panel-toggle launcher"
-- M.lockscreen  = "qs ipc call lockscreen lock"
M.lockscreen  = "noctalia msg session lock"
M.controller  = "noctalia msg panel-toggle control-center"
-- M.clipboard   = "cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"
M.clipboard   = "noctalia msg panel-toggle clipboard"

return M