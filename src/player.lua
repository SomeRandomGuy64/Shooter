Player = Entity:extend()

function Player:new(x, y)
    Player.super.new(self, x, y)

end

function Player:update(dt)
    Player.super.update(self, dt)

    if love.keyboard.isDown("left") then
        self.x = self.x - 200 * dt
    end
    if love.keyboard.isDown("right") then
        self.x = self.x + 200 * dt
    end
end

function Player:draw()
    Player.super.update(self)
    love.graphics.rectangle("fill", self.x, self.y, 10, 10)
end