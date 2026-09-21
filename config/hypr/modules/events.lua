local switcher = require("modules.switcher")

-- TODO: enable when workspace.special_active event is supported
-- hl.on("workspace.special_active", function(ws, monitor)
--     if ws == nil or ws.name ~= "special:dropterm" then
--         return
--     end
--     functions.fit_dropterm_to_monitor(monitor)
-- end)

-- TODO: enable when workspace.move_to_monitor event is supported
-- hl.on("workspace.move_to_monitor", function(ws, monitor)
--     if ws.name ~= "special:dropterm" then
--         return
--     end
--     functions.fit_dropterm_to_monitor(monitor)
-- end)

hl.on('layer.closed', switcher.close_window_switcher)


-- hl.on("window.active", function(w)
--   hl.notification.create({ text = "Window focused: " .. w.title, timeout = 5000, icon = "ok" })
-- end)

-- hl.on("workspace.special_active", function(w, m)
--   hl.notification.create({ text = "Window focused: ", timeout = 5000, icon = "ok" })
-- end)