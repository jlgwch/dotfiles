local M = {}

local special_workspace = "special:dropterm"
local launch_cmd = "alacritty --class dropterm -e bash -c 'tmux attach-session -t tmux 2>/dev/null || tmux new-session -s tmux'"

local function find_dropterm()
    for _, window in ipairs(hl.get_windows()) do
        if window.class == "dropterm" then
            return window
        end
    end
end

local function fit_dropterm_to_monitor(window, monitor)
    if monitor == nil then
        return
    end

    local mw = monitor.width / monitor.scale
    local selector = "address:" .. window.address
    if not window.floating then
        hl.dispatch(hl.dsp.window.float({ action = "toggle", window = selector }))
    end
    hl.dispatch(hl.dsp.window.resize({ x = mw - 16, y = 500, window = selector }))
    hl.dispatch(hl.dsp.window.move({ x = monitor.x + 8, y = monitor.y + 48, window = selector }))
end

hl.on("window.open", function(window)
    if window.class == "dropterm" then
        fit_dropterm_to_monitor(window, window.monitor or hl.get_active_monitor())
        hl.dispatch(hl.dsp.focus({ window = window }))
        hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top", window = window }))
    end
end)

function M.toggle_dropterm()
    local workspace = hl.get_active_workspace()
    if workspace == nil then
        return
    end

    local window = find_dropterm()
    if window == nil then
        hl.exec_cmd(launch_cmd)
        return
    end

    local selector = "address:" .. window.address
    if window.workspace and window.workspace.name == workspace.name then
        hl.dispatch(hl.dsp.window.move({ workspace = special_workspace, window = selector, follow = false }))
    else
        local monitor = workspace.monitor or hl.get_active_monitor()
        hl.dispatch(hl.dsp.window.move({ workspace = workspace, window = selector, follow = false }))
        fit_dropterm_to_monitor(window, monitor)
        hl.dispatch(hl.dsp.focus({ window = selector }))
        hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top", window = selector }))
    end
end

return M
