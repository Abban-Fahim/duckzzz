Duck = Class { __includes = Sprite {} }

function Duck:init(index)
    self.index = index
    self.height = 32
    self.width = 32
    self.sprite = duckImage
    self.y = math.random(V_height - FloorHeight - self.height, V_height - FloorHeight - self.height - 100)
    self.x = V_width
    self.dx = 0
    self.alive = true
end

function Duck:update(dt)
    if self.x < -self.width then
        print(self.index, "missed")
        self.alive = false
    end
    self.dx = GameSpeed * 25 * dt
    self.x = math.floor(self.x - self.dx)
end

function Duck:render()
    love.graphics.draw(self.sprite, self.x, self.y)
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

-- function Duck:remove(ducksArray)
--     print("gg")
--     -- TO FIXXXX !!
--     -- table.remove(ducksArray, self.index)
--     for i, duck in ipairs(ducksArray) do
--         ducksArray[duck.index - 1] = duck;
--         duck.index = duck.index - 1
--     end
--     print(debug(ducksArray))
-- end
