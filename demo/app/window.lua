local M = {}

function M.resize(game_width, game_height)
    if sys.get_sys_info().system_name == "Windows" then
        local displays = defos.get_displays()
        local current_display_id = defos.get_current_display_id()
        local screen_width = displays[current_display_id].bounds.width
        local screen_height = displays[current_display_id].bounds.height

        game_width = game_width or sys.get_config("display.width", 1000)
        game_height = game_height or sys.get_config("display.height", 1000)

        local factor = 0.5
        if tonumber(sys.get_config("display.high_dpi", 0)) == 1 then
            factor = 1
        end

        local x, y, w, h = defos.get_view_size()
        w = game_width * factor
        h = game_height * factor
        while screen_height * 0.9 <= h do
            w = w / 1.25
            h = h / 1.25
        end
        defos.set_view_size(x, y, w, h)
    end
end

function M.center()
    if sys.get_sys_info().system_name == "Windows" then
        local displays = defos.get_displays()
        local current_display_id = defos.get_current_display_id()
        local screen_width = displays[current_display_id].bounds.width
        local screen_height = displays[current_display_id].bounds.height

        local x, y, w, h = defos.get_window_size()
        x = math.floor((screen_width - w) / 2)
        y = math.floor((screen_height - h) / 2)
        defos.set_window_size(x, y, w, h)
    end
end

return M
