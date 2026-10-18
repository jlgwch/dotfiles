hl.config({
    general = {
        gaps_in  = 4,
        gaps_out = 6,

        border_size = 2,

        col = {
            -- active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            -- active_border = "rgba(ff79c6ff)",
            -- inactive_border = "rgba(595959aa)", -- rgba(ff79c666)

            active_border = "rgb(bd93f9)",
            inactive_border = "rgba(44475aaa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
        no_focus_fallback = true,
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 0.95,
        inactive_opacity = 0.95,
        fullscreen_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            -- color        = 0xee1a1a1a,
            color = "rgba(1E202966)",
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 2,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    xwayland = {
        force_zero_scaling = true
    },

    dwindle = {
        preserve_split = true, -- You probably want this
    },

    master = {
        new_status = "master",
    },

    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,
        -- float_switch_override_focus = 0,
        -- mouse_refocus = true,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

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

    ecosystem = {
        no_donation_nag = true,
        enforce_permissions = true
    },

    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false,
        -- Fixing the issue where application windows do not appear on the monitor where the mouse is located upon the first launch of Hyprland
        initial_workspace_tracking = 0,
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