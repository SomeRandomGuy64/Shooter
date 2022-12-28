Enemy = Entity:extend()

function Enemy:new(x, y)
    Enemy.super.new(self, x, y)

    self.x = 20
    self.y = 20

    self.speed = 100

    self.radius = 10
end

function Enemy:update(dt)
    Enemy.super.update(self, dt)
    self.x = self.x + self.speed * dt
    if self.x > 480 - self.radius  or self.x < 0 + self.radius then
        self.speed = -self.speed
    end
end

function Enemy:draw()
    Enemy.super.draw(self)
    love.graphics.setColor(1,0,0)
    love.graphics.circle("line", self.x, self.y, self.radius)
end