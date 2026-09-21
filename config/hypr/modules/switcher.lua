local M = {}

function M.open_window_switcher()
    hl.dispatch(hl.dsp.exec_cmd("noctalia msg window-switcher"))
    hl.dispatch(hl.dsp.submap 'window_switcher')
end

function M.close_window_switcher(layer)
    if layer.namespace == 'noctalia-window-switcher' then
        hl.dispatch(hl.dsp.submap 'reset')
    end
end

return M