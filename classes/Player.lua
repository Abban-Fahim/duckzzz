Player = Class {}

function Player:init()
    self.y = FloorHeight      -- px
    self.dy = 0               -- px/s
    self.a = -0.4 * GameSpeed -- px/s^2
    self.jumping = false
    self.sprite = love.graphics.newImage('assets/purple.png')
end

function Player:update(dt)
    if self.y > FloorHeight then
        self.dy = self.dy + self.a * dt
    end
    self.y = math.floor(self.y + self.dy)
    if self.y <= FloorHeight then
        self.dy = 0
    end
    print("v:   " .. self.dy .. " | a: " .. self.a .. " | y: " .. V_height - self.y)
end

function Player:render()
    love.graphics.draw(self.sprite, 10, V_height - self.y - 32)
end
