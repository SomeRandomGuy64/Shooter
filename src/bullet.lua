Bullet = Entity:extend()

function Bullet:new(x, y)
    Bullet.super.new(self, x, y)
    
    self.speed = 1000
end

function Bullet:update(dt)
    Bullet.super.update(self, dt)

    self.y = self.y - self.speed * dt
end

function Bullet:draw()
    Bullet.super.update(self)
    love.graphics.rectangle("fill", self.x, self.y, 10, 10)
end