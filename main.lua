push = require "lib.push"
Class = require "lib.class"
require "classes.util"
require "classes.Sprite"
require "classes.Player"
require "classes.Duck"

-- Global constants
W_width = 1280
W_height = 720
V_width = 432
V_height = 243
ScreenRatio = V_height / W_height
FloorHeight = 32
GameSpeed = 5

touch_jump = false


function love.load()
    os = love.system.getOS()
    fullscreenOption = false

    -- setup code
    if os == "Android" then
        fullscreenOption = true
        W_width, W_height = love.window.getDesktopDimensions()
    end
    love.graphics.setDefaultFilter("nearest", "nearest")
    push:setupScreen(V_width, V_height, W_width, W_height, {
        fullscreen = fullscreenOption,
        resizable = false,
        highdpi = false,
        upscale = "pixel-perfect"
    })

    duckImage = love.graphics.newImage("assets/duck.png")
    player = Player()
    ducks = { Duck(1) }
    local song = love.audio.newSource("assets/chip-tal.wav", "stream")
    song:play()
    song:setLooping(true)
end

function love.draw()
    push:apply("start")

    -- UI stuff
    love.graphics.clear(46 / 255, 42 / 255, 49 / 255, 1)
    love.graphics.setColor(216 / 255, 215 / 255, 218 / 255)
    love.graphics.rectangle("fill", 10, V_height - FloorHeight, V_width - 20, FloorHeight - 10)

    --if os = "Android" then
    love.graphics.rectangle(touch_jump and "fill" or "line", V_width - 25, V_height - FloorHeight - 25, 20, 20)
    --end

    player:render()
    for i, duck in ipairs(ducks) do
        duck:render()
    end

    push:apply("end")
end

function love.update(dt)
    player:update(dt)
    for i, duck in ipairs(ducks) do
        if not duck.alive or checkCollision(duck, player) then
            table.remove(ducks, i)
        else
            duck:update(dt)
        end
    end

    rand = math.random()
    if rand > 0.9 then
        table.insert(ducks, Duck(#ducks + 1))
    end
end

function love.keypressed(key)
    if (key == "up" or key == "space") and not player.jumping then
        player:jump()
    elseif key == "escape" then
        love.event.quit()
    end
end

function love.touchpressed(id, x, y)
    x, y = push:toGame(x, y)
    print(x, y)
    if x > V_width - 25 and x < V_width - 5 and y > V_height - FloorHeight - 25 and y < V_height - FloorHeight - 5 then
        touch_jump = true
        if not player.jumping then
            player:jump()
        end
    else
        touch_jump = false
    end
end

function love.resize(w, h)
    push:resize(w, h)
end
