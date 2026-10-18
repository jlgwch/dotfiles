-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

require("modules.env")
require("modules.monitors")
require("modules.autostart")
require("modules.keybindings")
require("modules.rules")
require("modules.animations.default")
require("modules.config")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")
hl.permission({
    binary = "/usr/bin/noctalia",
    type = "screencopy",
    mode = "allow",
})
hl.permission({
    binary = "/usr/bin/noctalia",
    type = "cursorpos",
    mode = "allow",
})

-- Super+W：启动微信，或在当前工作区与隐藏工作区之间切换。
require("modules.scratchpad").register({
    name = "wechat",
    class = "wechat",
    launch_cmd = "wechat",
    key = "SUPER + W",
})

require("modules.scratchpad").register({
    name = "sing-box",
    class = "sing-box",
    launch_cmd = "sing-box",
    key = "SUPER + GRAVE",
})

-- require("modules.scratchpad").register({
--     name = "google-chrome",
--     class = "google-chrome",
--     launch_cmd = "google-chrome-stable",
--     key = "SUPER + G",
-- })
