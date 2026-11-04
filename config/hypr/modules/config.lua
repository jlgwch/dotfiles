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

    xwayland = {
        force_zero_scaling = true
    },

    render = {
        -- send_content_type = false,
        -- cm_auto_hdr = 0,
    },

    dwindle = {
        preserve_split = true, -- You probably want this
        smart_split    = false,
        smart_resizing = true,
    },

    master = {
        new_status = "master",
    },

    ecosystem = {
        no_donation_nag = true,
        enforce_permissions = true
    },


})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})
