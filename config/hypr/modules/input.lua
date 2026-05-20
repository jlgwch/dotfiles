---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },

        numlock_by_default = true,
    },

    cursor = {
        no_warps = false,
        warp_on_change_workspace = 1,
        warp_on_toggle_special = 1,
        -- default_monitor = "eDP-1",
        -- no_hardware_cursors = 1 -- fix cursor lag when moving external mouse
    },

    ecosystem = {
        no_donation_nag = true
    },

})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})