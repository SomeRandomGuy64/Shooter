Enemy = Entity:extend()

function Enemy:new(x, y)
    Enemy.super.new(self, x, y)

    self.x = 20
    self.y = 0.00001 * (self.x)^3 - (2.5 * self.x) + 520

    self.oldX = 0
    self.oldY = 0

    self.speed = 100

    self.radius = 10

    self.angleX = 0
    self.angleY = 0
    self.hypotenuse = 0
end

function Enemy:update(dt)
    Enemy.super.update(self, dt)
    self.oldX = self.x
    self.oldY = self.y
    self.x = self.x + self.speed * dt
    self.y = 0.00001 * (self.x)^3 - (2.5 * self.x) + 520

    self.angleX = self.x - self.oldX
    self.angleY = self.y - self.oldY
    self.hypotenuse = math.sqrt(self.angleX^2 + self.angleY^2)
    

    if self.x >= 480 - self.radius  or self.x <= 0 + self.radius then
        self.speed = -self.speed
    end
end

function Enemy:draw()
    Enemy.super.draw(self)
    love.graphics.setColor(1,0,0)
    love.graphics.circle("line", self.x, self.y, self.radius)
end