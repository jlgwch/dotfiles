-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

local programs = require("modules.programs") 

hl.on("hyprland.start", function ()
  hl.exec_cmd("fcitx5")
  hl.exec_cmd("qs")
  -- hl.exec_cmd("dunst")
  hl.exec_cmd("blueman-applet")
  hl.exec_cmd(programs.terminal)
  hl.exec_cmd("nm-applet")
  hl.exec_cmd("hypridle")
  -- hl.exec_cmd("waybar")
--   hl.exec_cmd("waybar & hyprpaper & firefox")
end)
