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
M.menu        = "rofi -show drun"
M.applauncher = "qs ipc call applauncher toggle"

return M