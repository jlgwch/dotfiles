-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("osIn",   { type = "bezier", points = { {0.23, 1.00},    {0.32, 1.00} } })
hl.curve("osOut", { type = "bezier", points = { {0.50, 0.00}, {0.75, 0.00} } })
hl.curve("osMove", { type = "bezier", points = { {0.33, 1.00},       {0.68, 1.00} } })
hl.curve("osWind", { type = "bezier", points = { {0.42, 0.00},   {0.58, 1.00} } })
hl.curve("overshot", { type = "bezier", points = { {0.34, 1.56},    {0.64, 1.00}  } })
hl.curve("bounce", { type = "bezier", points = { {0.20, 1.30},    {0.40, 1.00}  } })
hl.curve("liner", { type = "bezier", points = { {0.00, 0.00},    {1.00, 1.00}  } })

-- Default springs
-- hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

-- hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
-- hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.5, bezier = "overshot",      style = "popin 80%" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.5, bezier = "overshot",      style = "popin 80%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 4.5, bezier = "osOut",         style = "popin 90%" })
hl.animation({ leaf = "windowsMove",   enabled = true,  speed = 5.0, bezier = "osMove" })

hl.animation({ leaf = "fade",          enabled = true,  speed = 4.0, bezier = "osIn" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 4.0, bezier = "osIn" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 3.0, bezier = "osOut" })
hl.animation({ leaf = "fadeSwitch",          enabled = true,  speed = 4.0, bezier = "osIn" })
hl.animation({ leaf = "fadeShadow",          enabled = true,  speed = 4.0, bezier = "osIn" })
hl.animation({ leaf = "fadeDim",          enabled = true,  speed = 4.0, bezier = "osIn" })
hl.animation({ leaf = "fadeLayers",          enabled = true,  speed = 4.0, bezier = "osIn" })
hl.animation({ leaf = "fadeLayersIn",          enabled = true,  speed = 4.0, bezier = "osIn" })
hl.animation({ leaf = "fadeLayersOut",       enabled = true,  speed = 3.0, bezier = "osOut" })

hl.animation({ leaf = "layers",        enabled = true,  speed = 4.0, bezier = "overshot", style = "slide" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4.0, bezier = "overshot", style = "slide" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 3.0, bezier = "osOut",    style = "slide" })

hl.animation({ leaf = "workspaces",       enabled = true,  speed = 6.0, bezier = "osMove", style = "slide" })
hl.animation({ leaf = "workspacesIn",     enabled = true,  speed = 6.0, bezier = "osMove", style = "slide" })
hl.animation({ leaf = "workspacesOut",    enabled = true,  speed = 6.0, bezier = "osMove", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true,  speed = 6.0, bezier = "overshot", style = "slidevert" })
-- hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })