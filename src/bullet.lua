Bullet = Entity:extend()

function Bullet:new(x, y)
    Bullet.super.new(self, x, y)

    self.speed = 1000

    self.radius = 5
end

function Bullet:update(dt)
    Bullet.super.update(self, dt)

    self.y = self.y - self.speed * dt
end

function Bullet:draw()
    Bullet.super.update(self)
    --sets colour to blue
    love.graphics.setColor(0,0,1)
    love.graphics.circle("fill", self.x, self.y, self.radius)
end