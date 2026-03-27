local keys = {
    A = false,
    B = false,
    Y = false,
    X = false,
    UP = false,
    LEFT = false,
    DOWN = false,
    RIGHT = false,
    START = false,
    SELECT = false,
    L = false,
    R = false
}


function tap(button)
    joypad.set(1, {[button] = true})
    emu.frameadvance()
    joypad.set(1, {[button] = false})
    emu.frameadvance()
end


function hold(button, frames)
    frames = frames or 1
    for i = 1, frames do
        joypad.set(1, {[button] = true})
        emu.frameadvance()
    end
    joypad.set(1, {[button] = false})
    emu.frameadvance()
end


function press_button(button, times)
    times = times or 1
    for i = 1, times do
        tap(button)  
    end
end

-- Run a sequence of actions: { {"A", 1}, {"RIGHT", 5}, {"B", 1} }
function sequence(actions)
    for _, action in ipairs(actions) do
        local button = action[1]
        local frames = action[2] or 1
        hold(button, frames)
    end
end