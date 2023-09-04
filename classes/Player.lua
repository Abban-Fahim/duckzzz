Player = Class { __includes = Sprite {} }

function Player:init()
    -- print(Sprite {}.height, "ok lol")
    baseHeight = V_height - FloorHeight - self.height

    self.offset = 0
    self.x = 10
    self.y = baseHeight       -- px
    self.dy = 0               -- px/s
    self.a = -0.4 * GameSpeed -- px/s^2
    self.jumping = false
    self.sprite = love.graphics.newImage('assets/purple.png')
end

function Player:update(dt)
    if self.jumping then
        self.dy = self.dy + self.a * dt
    end
    self.offset = math.floor(self.offset + self.dy)
    self.y = baseHeight - self.offset
    if self.y >= baseHeight then
        self.dy = 0
        self.jumping = false
    end
    -- print("v:   " .. self.dy .. " | a: " .. self.a .. " | y: " .. self.y)
end

function Player:render()
    love.graphics.draw(self.sprite, self.x, self.y)
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

function Player:jump()
    self.dy = self.dy + 3.5
    self.jumping = true
end
