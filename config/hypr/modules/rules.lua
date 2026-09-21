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
hl.workspace_rule({ workspace = "2", monitor = "eDP-1", default = true })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1", default = true })
hl.workspace_rule({ workspace = "4", monitor = "eDP-1", default = true })
hl.workspace_rule({ workspace = "5", monitor = "eDP-1", default = true })

hl.workspace_rule({ workspace = "6", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "7", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "8", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "9", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "10", monitor = "HDMI-A-1", default = true })

-- nautilus
hl.window_rule({
    match = { class = "^(org.gnome.Nautilus)$" },
    float = true,
    center = true,
    animation = "fade",
    size = { "(monitor_w*0.6)", "(monitor_h*0.6)" }
})

-- nm-applet
hl.window_rule({
    match = { class = "^(nm-connection-editor)$" },
    float = true,
    center = true,
    animation = "fade",
    size = { "(monitor_w*0.6)", "(monitor_h*0.6)" }
})

-- blueman
hl.window_rule({
    match = { class = "^blueman-.*$" },
    float = true,
    center = true,
    animation = "fade",
    size = { "(monitor_w*0.6)", "(monitor_h*0.6)" }
})

-- pavucontrol
hl.window_rule({
    match = { class = "^(org.pulseaudio.pavucontrol)$" },
    float = true,
    center = true,
    animation = "fade",
    size = { "(monitor_w*0.6)", "(monitor_h*0.6)" }
})

-- fcitx5
hl.window_rule({
    match = { class = "^(org.fcitx.fcitx5-config-qt)$" },
    float = true,
    center = true,
    animation = "fade",
    size = { "(monitor_w*0.6)", "(monitor_h*0.6)" }
})

-- matplotlib
hl.window_rule({
    match = { class = "^(matplotlib)$" },
    float = true,
    center = true,
    animation = "fade",
    size = { "(monitor_w*0.6)", "(monitor_h*0.6)" }
})

-- gopeed
hl.window_rule({
    match = { class = "^(gopeed)$" },
    float = true,
    center = true,
    animation = "fade",
    size = { "(monitor_w*0.6)", "(monitor_h*0.6)" }
})

-- xdg-desktop-portal-gtk
hl.window_rule({
    match = { class = "^(xdg-desktop-portal-gtk)$" },
    float = true,
    center = true,
    animation = "fade",
    size = { "(monitor_w*0.6)", "(monitor_h*0.6)" }
})

-- swayimg
hl.window_rule({
    match = { class = "^(swayimg)$" },
    float = true,
    center = true,
    animation = "fade",
    size = { "(monitor_w*0.6)", "(monitor_h*0.6)" }
})

-- org.nomacs.ImageLounge
hl.window_rule({
    match = { class = "^(org.nomacs.ImageLounge)$" },
    float = true,
    center = true,
    animation = "fade",
    size = { "(monitor_w*0.6)", "(monitor_h*0.6)" }
})

-- flameshot
-- hl.window_rule({
--     name = "proper-flameshot-handling",
--     match = { class = "flameshot" },
--     center = true,
--     animation = "fade",
--     rounding = 0,
--     border_size = 0,
--     fullscreen_state = "0 0",
--     float = true,
--     pin = true,
--     -- monitor = "eDP-1",
--     -- move = { 0, 0 },
--     size = { "monitor_w*0.6", "monitor_h*0.6" },
-- })

-- dropterm
hl.workspace_rule({
    workspace = "special:dropterm",
    on_created_empty = "[float; size monitor_w-16 500; move 8 48] alacritty --class dropterm -e bash -c 'tmux attach-session -t tmux 2>/dev/null || tmux new-session -s tmux'"
})

-- wechat
hl.window_rule({
    match = { class = "^(wechat)$" },
    float = true,
    center = true,
    animation = "fade",
    size = { "(monitor_w*0.8)", "(monitor_h*0.8)" }
})

hl.window_rule({
    match = { class = "^(wechat)$", title =  "^(图片和视频)$"},
    float = true,
    center = true,
    animation = "fade",
    size = { "(monitor_w*0.6)", "(monitor_h*0.6)" }
})

-- mihomo-party
hl.window_rule({
    match = { class = "^(mihomo-party)$" },
    float = true,
    center = true,
    animation = "fade",
    size = { "(monitor_w*0.6)", "(monitor_h*0.8)" }
})

-- flclash
hl.window_rule({
    match = { title = "^(FlClash)$" },
    float = true,
    center = true,
    animation = "fade",
    size = { "(monitor_w*0.6)", "(monitor_h*0.8)" }
})

-- google-chrome
hl.window_rule({
    name = "bitwarden",
    match = {
        -- class = "^(chrome-nngceckbapebfimnlniiiahkandclblb-Default)$", title = "^(Bitwarden)$" 
        initial_class = "chrome-nngceckbapebfimnlniiiahkandclblb-Default",
        initial_title = "_crx_nngceckbapebfimnlniiiahkandclblb",
    },
    float = true,
    center = true,
    animation = "fade",
    size = { "(monitor_w*0.6)", "(monitor_h*0.6)" }
})

-- Noctalia Settings
hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})

hl.layer_rule({
    name = "noctalia",
    match = {
        namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
    },
    no_anim = true,
    ignore_alpha = 0.5,
    blur = true,
    blur_popups = true,
})