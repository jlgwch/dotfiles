------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- hl.monitor({
--     output   = "",
--     mode     = "preferred",
--     position = "auto",
--     scale    = "auto",
-- })

hl.monitor({
    output = "desc:California Institute of Technology 0x1600",
    mode = "highres@highrr",
    position = "0x0",
    scale = 1.6,
    vrr = 0,
    bitdepth = 10,
    transform = 0,
})

hl.monitor({
    output = "desc:Xiaomi Corporation Mi Monitor 2757500127062",
    mode = "highres@highrr",
    position = "auto-left",
    scale = 1.25,
    vrr = 0,
    transform = 0,
})