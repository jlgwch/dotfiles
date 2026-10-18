local Scratchpad = { _instances = {} }

local function fit_to_monitor(window, monitor)
    if not monitor then return end

    if window.fullscreen ~= 0 or window.fullscreen_client ~= 0 then
        hl.dispatch(hl.dsp.window.fullscreen_state({ internal = 0, client = 0, window = window }))
    end
    if not window.floating then
        hl.dispatch(hl.dsp.window.float({ action = "toggle", window = window }))
    end
    hl.dispatch(hl.dsp.window.resize({
        x = monitor.width / monitor.scale - 16,
        y = monitor.height / monitor.scale - 56,
        window = window,
    }))
    hl.dispatch(hl.dsp.window.move({ x = monitor.x + 8, y = monitor.y + 48, window = window }))
end

function Scratchpad.register(opts)
    local specialWs = "special:" .. opts.name
    local tag = "scratchpad-" .. opts.name

    local function schedule_fit(window)
        if window.class ~= opts.class then return end

        -- Startup, login and scale changes can restore client geometry after the event.
        local selector = "address:" .. window.address
        hl.timer(function()
            local current = hl.get_window(selector)
            if current and current.class == opts.class and current.workspace and not current.workspace.special then
                fit_to_monitor(current, current.workspace.monitor)
            end
        end, { timeout = 150, type = "oneshot" })
    end

    hl.on("window.open", schedule_fit)
    hl.on("window.class", schedule_fit)
    hl.on("window.title", schedule_fit)
    hl.on("window.move_to_workspace", function(window, workspace)
        if not workspace.special then schedule_fit(window) end
    end)

    for _, window in ipairs(hl.get_windows()) do
        if window.class == opts.class then
            fit_to_monitor(window, window.monitor or hl.get_active_monitor())
        end
    end

    local function toggle()
        local workspace = hl.get_active_workspace()
        if not workspace then return end

        local window
        for _, candidate in ipairs(hl.get_windows()) do
            if candidate.class == opts.class then
                window = candidate
                break
            end
        end

        if not window then
            hl.exec_cmd(opts.launch_cmd)
            return
        end

        hl.dispatch(hl.dsp.window.tag({ tag = "+" .. tag, window = window }))
        if window.workspace and window.workspace.name == workspace.name then
            hl.dispatch(hl.dsp.window.move({
                workspace = specialWs,
                window = window,
                follow = false,
            }))
        else
            hl.dispatch(hl.dsp.window.move({
                workspace = workspace,
                window = "tag:" .. tag,
                follow = false,
            }))
            hl.dispatch(hl.dsp.window.tag({ tag = "-" .. tag, window = window }))
            hl.dispatch(hl.dsp.focus({ window = window }))
        end
    end

    hl.bind(opts.key, toggle)
    Scratchpad._instances[opts.name] = { toggle = toggle }
    return Scratchpad._instances[opts.name]
end

return Scratchpad
