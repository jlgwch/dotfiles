--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- custom
hl.window_rule({ match = { xwayland = true }, border_color = "rgba(ff0000ff)" })
hl.window_rule({ match = { fullscreen = true }, border_color = "rgba(00ff00ff)" })

hl.workspace_rule({ workspace = "1", monitor = "eDP-1", default = true })
hl.workspace_rule({ workspace = "10", monitor = "HDMI-A-1", default = true })

-- nautilus
hl.window_rule({ match = { class = "^(org.gnome.Nautilus)$" }, float = true })
hl.window_rule({ match = { class = "^(org.gnome.Nautilus)$" }, center = true })
hl.window_rule({ match = { class = "^(org.gnome.Nautilus)$" }, size = { "(monitor_w*0.6)", "(monitor_h*0.6)" } })

-- nm-applet
hl.window_rule({ match = { class = "^(nm-connection-editor)$" }, float = true })
hl.window_rule({ match = { class = "^(nm-connection-editor)$" }, center = true })
hl.window_rule({ match = { class = "^(nm-connection-editor)$" }, size = { "(monitor_w*0.6)", "(monitor_h*0.6)" } })

-- blueman
hl.window_rule({ match = { class = "^blueman-.*$" }, float = true })
hl.window_rule({ match = { class = "^blueman-.*$" }, center = true })
hl.window_rule({ match = { class = "^blueman-.*$" }, size = { "(monitor_w*0.6)", "(monitor_h*0.6)" } })

-- pavucontrol
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, float = true })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, center = true })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, size = { "(monitor_w*0.6)", "(monitor_h*0.6)" } })

-- fcitx5
hl.window_rule({ match = { class = "^(org.fcitx.fcitx5-config-qt)$" }, float = true })
hl.window_rule({ match = { class = "^(org.fcitx.fcitx5-config-qt)$" }, center = true })
hl.window_rule({ match = { class = "^(org.fcitx.fcitx5-config-qt)$" }, size = { "(monitor_w*0.6)", "(monitor_h*0.6)" } })

-- matplotlib
hl.window_rule({ match = { class = "^(matplotlib)$" }, float = true })
hl.window_rule({ match = { class = "^(matplotlib)$" }, center = true })
hl.window_rule({ match = { class = "^(matplotlib)$" }, size = { "(monitor_w*0.6)", "(monitor_h*0.6)" } })

-- gopeed
hl.window_rule({ match = { class = "^(gopeed)$" }, float = true })
hl.window_rule({ match = { class = "^(gopeed)$" }, center = true })
hl.window_rule({ match = { class = "^(gopeed)$" }, size = { "(monitor_w*0.6)", "(monitor_h*0.6)" } })

-- xdg-desktop-portal-gtk
hl.window_rule({ match = { class = "^(xdg-desktop-portal-gtk)$" }, float = true })
hl.window_rule({ match = { class = "^(xdg-desktop-portal-gtk)$" }, center = true })
hl.window_rule({ match = { class = "^(xdg-desktop-portal-gtk)$" }, size = { "(monitor_w*0.6)", "(monitor_h*0.6)" } })

-- swayimg
hl.window_rule({ match = { class = "^(swayimg)$" }, float = true })
hl.window_rule({ match = { class = "^(swayimg)$" }, center = true })
hl.window_rule({ match = { class = "^(swayimg)$" }, size = { "(monitor_w*0.6)", "(monitor_h*0.6)" } })

-- org.nomacs.ImageLounge
hl.window_rule({ match = { class = "^(org.nomacs.ImageLounge)$" }, float = true })
hl.window_rule({ match = { class = "^(org.nomacs.ImageLounge)$" }, center = true })
hl.window_rule({ match = { class = "^(org.nomacs.ImageLounge)$" }, size = { "(monitor_w*0.6)", "(monitor_h*0.6)" } })


  hl.layer_rule({ "blur",            "applauncher" })
  hl.layer_rule({ "ignorezero",      "applauncher" })
  hl.layer_rule({ "ignorealpha 0.3", "applauncher" })