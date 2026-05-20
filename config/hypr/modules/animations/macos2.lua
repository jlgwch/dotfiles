-- ============================================================================
-- Hyprland 0.55+ macOS 风格动画配置 (Lua 语法)
-- 参考: https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
--
-- 在主 hyprland.conf 中通过 `source = ~/.config/hypr/animations.lua`
-- 引入 (Hyprland 0.55 起支持 .lua 配置)。
-- ============================================================================


-- ----------------------------------------------------------------------------
-- 1. 曲线 (Curves)
--    macOS 的核心观感来自 spring 弹簧曲线 (mass / stiffness / dampening)。
--    建议 mass 保持 1，仅调整 stiffness (速度) 与 dampening (阻尼/回弹)。
-- ----------------------------------------------------------------------------

-- 主弹簧: 开窗 / 关窗, 略带回弹, 类似 macOS Dock 弹出
hl.curve("md3Spring",      { type = "spring", mass = 1, stiffness = 220, dampening = 22 })

-- 较硬弹簧: 工作区切换, 干脆利落, 几乎无回弹
hl.curve("md3SpringFast",  { type = "spring", mass = 1, stiffness = 350, dampening = 30 })

-- 柔软弹簧: 拖动 / 平铺移动, 顺滑跟手
hl.curve("md3SpringSoft",  { type = "spring", mass = 1, stiffness = 150, dampening = 18 })

-- 标准苹果"easeOut"贝塞尔, 用于淡入淡出 (无回弹)
hl.curve("appleEaseOut",   { type = "bezier", points = { {0.25, 0.1},  {0.25, 1.0}  } })

-- 苹果"easeInOut", 用于细微的属性渐变 (border / dim)
hl.curve("appleEaseInOut", { type = "bezier", points = { {0.42, 0.0},  {0.58, 1.0}  } })

-- 轻微 overshoot, 给 popin 一点"啵"的感觉
hl.curve("appleOvershoot", { type = "bezier", points = { {0.34, 1.56}, {0.64, 1.0}  } })


-- ----------------------------------------------------------------------------
-- 2. 动画 (Animations)
--    动画树: 子节点未设置时会继承父节点。
--    speed 单位是 ds (1ds = 100ms), spring 曲线会自适应 speed。
-- ----------------------------------------------------------------------------

-- ── 窗口 ────────────────────────────────────────────────────────────────────
-- popin 配合 80% 起始, 模拟 macOS App 从图标"放大弹出"的感觉
hl.animation({ leaf = "windows",     enabled = true, speed = 4, spring = "md3Spring",     style = "popin 80%" })
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 4, spring = "md3Spring",     style = "popin 80%" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 3, spring = "md3SpringFast", style = "popin 90%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4, spring = "md3SpringSoft" })

-- ── 图层 (waybar / wofi / 通知等) ───────────────────────────────────────────
hl.animation({ leaf = "layers",      enabled = true, speed = 3, bezier  = "appleEaseOut",  style = "slide" })
hl.animation({ leaf = "layersIn",    enabled = true, speed = 3, spring = "md3Spring",      style = "slide" })
hl.animation({ leaf = "layersOut",   enabled = true, speed = 3, bezier  = "appleEaseOut",  style = "slide" })

-- ── 淡入淡出 ────────────────────────────────────────────────────────────────
hl.animation({ leaf = "fade",        enabled = true, speed = 3, bezier = "appleEaseOut" })
hl.animation({ leaf = "fadeIn",      enabled = true, speed = 3, bezier = "appleEaseOut" })
hl.animation({ leaf = "fadeOut",     enabled = true, speed = 2, bezier = "appleEaseOut" })
hl.animation({ leaf = "fadeSwitch",  enabled = true, speed = 2, bezier = "appleEaseInOut" })
hl.animation({ leaf = "fadeShadow",  enabled = true, speed = 3, bezier = "appleEaseInOut" })
hl.animation({ leaf = "fadeDim",     enabled = true, speed = 3, bezier = "appleEaseInOut" })
hl.animation({ leaf = "fadePopups",  enabled = true, speed = 2, bezier = "appleEaseOut" })

-- ── 边框 ────────────────────────────────────────────────────────────────────
hl.animation({ leaf = "border",      enabled = true, speed = 5, bezier = "appleEaseInOut" })
hl.animation({ leaf = "borderangle", enabled = false })  -- loop 会持续耗电, 默认关

-- ── 工作区: 横向滑动, 类似 macOS 三指切换 Space ─────────────────────────────
hl.animation({ leaf = "workspaces",       enabled = true, speed = 5, spring = "md3SpringFast", style = "slidefade 15%" })
hl.animation({ leaf = "workspacesIn",     enabled = true, speed = 5, spring = "md3SpringFast", style = "slidefade 15%" })
hl.animation({ leaf = "workspacesOut",    enabled = true, speed = 5, spring = "md3SpringFast", style = "slidefade 15%" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 4, spring = "md3Spring",     style = "slidevert" })

-- ── 其它 ────────────────────────────────────────────────────────────────────
hl.animation({ leaf = "zoomFactor",   enabled = true, speed = 6, bezier = "appleEaseInOut" })
hl.animation({ leaf = "monitorAdded", enabled = true, speed = 6, bezier = "appleEaseOut" })
