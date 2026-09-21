local M = {}

function M.fit_dropterm_to_monitor(monitor)
    if monitor == nil then
        return
    end

    local wins = hl.get_workspace_windows("special:dropterm")
    if wins == nil then
        return
    end

    local mw = monitor.width / monitor.scale
    for _, w in ipairs(wins) do
        if w.class == "dropterm" then
            hl.dispatch(hl.dsp.window.resize({ x = mw - 16, y = 500, window = "address:" .. w.address }))
            hl.dispatch(hl.dsp.window.move({ x = monitor.x + 8, y = monitor.y + 48, window = "address:" .. w.address }))
        end
    end
end

function M.toggle_dropterm()
    hl.dispatch(hl.dsp.workspace.toggle_special("dropterm"))
    M.fit_dropterm_to_monitor(hl.get_active_monitor())
end

return M
