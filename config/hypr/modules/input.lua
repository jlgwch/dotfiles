hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",
        repeat_delay       = 250,
        repeat_rate        = 35,
        focus_on_close     = 1,

        touchpad = {
            natural_scroll = true,
        },

        numlock_by_default = true,
    },

    cursor = {
        enable_hyprcursor = true,
        no_warps = false,
        -- no_hardware_cursors = 1 -- fix cursor lag when moving external mouse
    },
})