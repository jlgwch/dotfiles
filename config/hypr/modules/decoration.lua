hl.config({
    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 0.95,
        inactive_opacity = 0.95,
        fullscreen_opacity = 0.99,

        shadow = {
            enabled      = true,
            range        = 15,
            render_power = 4,
            -- color        = 0xee1a1a1a,
            color = "rgba(1E202966)",
        },

        blur = {
            enabled   = true,
            xray      = false,
            special   = false,
            new_optimizations = true,
            popups            = true,
            input_methods = true,
            size      = 4,
            passes    = 2,
            vibrancy  = 0.1696,
        },
    },
})