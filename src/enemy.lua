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
    self.oldHypotenuse = 0

    self.angle = 0
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

    if self.x >= 480 - self.radius or self.x <= 0 + self.radius then
        self.speed = -self.speed
    end
end

function Enemy:draw()
    Enemy.super.draw(self)
    love.graphics.setColor(1,0,0)
    love.graphics.circle("line", self.x, self.y, self.radius)

    local controlPoints = {240,20,-480,220,920,420,240,620}
    local curve = love.math.newBezierCurve(controlPoints)
    local time = love.timer.getTime()
    local loopTime = 4
    local t = (time / loopTime) % 1
    local x,y = curve:evaluate(t)

    love.graphics.circle("fill", x, y, self.radius)
    love.graphics.line(curve:render())
end