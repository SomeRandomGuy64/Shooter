Enemy = Entity:extend()

function Enemy:new(x, y)
    Enemy.super.new(self, x, y)

    self.x = 10
    self.y = 10

    self.speed = 100
end

function Enemy:update(dt)
    Enemy.super.update(self, dt)
    self.x = self.x + self.speed * dt
end

function Enemy:draw()
    Enemy.super.draw(self)
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("line", self.x, self.y, 15, 15)
end