-- macOS 26 风格：原生 spring 弹簧曲线

-- Spring curves
hl.curve("springDefault", { type = "spring", mass = 1,   stiffness = 200,  dampening = 20 })
hl.curve("springSnappy",  { type = "spring", mass = 0.8, stiffness = 300,  dampening = 22 })
hl.curve("springBouncy",  { type = "spring", mass = 1,   stiffness = 180,  dampening = 14 })
hl.curve("springHeavy",   { type = "spring", mass = 1.2, stiffness = 160,  dampening = 16 })
hl.curve("springSoft",    { type = "spring", mass = 1,   stiffness = 120,  dampening = 18 })
hl.curve("liner",         { type = "bezier", points = { {1, 1}, {1, 1} } })

-- 窗口动画
hl.animation({ leaf = "windows",     enabled = true, speed = 4, spring = "springBouncy",  style = "popin 60%" })
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 4, spring = "springBouncy",  style = "popin 60%" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 3, spring = "springSnappy",  style = "popin 60%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, spring = "springDefault", style = "slide" })

-- 淡入淡出
hl.animation({ leaf = "fadeIn",      enabled = true, speed = 3, spring = "springSnappy"  })
hl.animation({ leaf = "fadeOut",     enabled = true, speed = 4, spring = "springDefault" })
hl.animation({ leaf = "fadeSwitch",  enabled = true, speed = 3, spring = "springSoft"   })
hl.animation({ leaf = "fadeShadow",  enabled = true, speed = 4, spring = "springSoft"   })
hl.animation({ leaf = "fadeDim",     enabled = true, speed = 4, spring = "springSoft"   })

-- 边框
hl.animation({ leaf = "border",      enabled = true, speed = 3,  spring = "springDefault" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 50, bezier = "liner", style = "loop" })

-- 工作区切换
hl.animation({ leaf = "workspaces",  enabled = true, speed = 3, spring = "springHeavy", style = "slide" })
