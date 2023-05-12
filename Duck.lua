Duck = Class {}

function Duck:init(index)
    self.index = index
    self.x = 0
    self.dx = 0
    self.alive = true
end

function Duck:update(dt)
    if self.x > (V_width - 10) then
        self.alive = false
    end
    self.dx = GameSpeed * 25
    self.x = math.floor(self.x + self.dx * dt)
end

function Duck:render()
    love.graphics.rectangle("line", V_width - self.x, V_height - FloorHeight - 10, 10, 10)
end

function Duck:remove(ducksArray)
    table.remove(ducksArray, self.index)
    for i, duck in ipairs(ducksArray) do
        duck.index = duck.index - 1
    end
end
