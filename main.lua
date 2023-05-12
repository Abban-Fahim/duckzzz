push = require "push"
Class = require "class"
require "Player"
require "Duck"

-- Global constants
W_width = 1280
W_height = 720
V_width = 432
V_height = 243
ScreenRatio = V_height / W_height
FloorHeight = 32
GameSpeed = 5


function love.load()
    player = Player()
    ducks = { Duck(1) }

    -- setup code
    love.graphics.setDefaultFilter("nearest", "nearest")
    push:setupScreen(V_width, V_height, W_width, W_height, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

function love.draw()
    push:apply("start")

    love.graphics.setColor(.5, .5, .5)
    love.graphics.rectangle("fill", 10, V_height - FloorHeight, V_width - 20, FloorHeight - 10)
    player:render()
    for i, duck in ipairs(ducks) do
        duck:render()
    end

    push:apply("end")
end

function love.update(dt)
    player:update(dt)
    for i, duck in ipairs(ducks) do
        if duck.alive then
            duck:update(dt)
        else
            duck:remove(ducks)
        end
        print(duck.x, duck.index)
    end
end

function love.keypressed(key)
    if (key == "up" or key == "space") and player.y <= FloorHeight then
        player.dy = player.dy + 2
        player.jumping = true
    elseif key == "escape" then
        love.event.quit()
    elseif key == "d" then
        print(#ducks, "DDDD")
        table.insert(ducks, Duck(#ducks + 1))
    end
end
