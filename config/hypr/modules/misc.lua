hl.config({
    misc = {
        -- force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        -- disable_hyprland_logo   = false,
        -- Fixing the issue where application windows do not appear on the monitor where the mouse is located upon the first launch of Hyprland
        initial_workspace_tracking = 0,

        animate_manual_resizes       = false,
        animate_mouse_windowdragging = false,

        disable_hyprland_logo        = true,
        force_default_wallpaper      = 0,

        on_focus_under_fullscreen    = 2,
        allow_session_lock_restore   = true,
        middle_click_paste           = false,
        focus_on_activate            = true,
        session_lock_xray            = true,

        mouse_move_enables_dpms      = true,
        key_press_enables_dpms       = true,
    },
})