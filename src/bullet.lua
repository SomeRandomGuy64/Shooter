Bullet = Entity:extend()

function Bullet:new(x, y)
    Bullet.super.new(self, x, y)

    self.speed = 1000

    self.radius = 5

    self.dead = false
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

function Bullet:checkCollision(obj, score)
    local self_left = self.x - self.radius
    local self_right = self.x + self.radius
    local self_top = self.y - self.radius
    local self_bottom = self.y + self.radius

    local obj_left = obj.x - obj.radius
    local obj_right = obj.x + obj.radius
    local obj_top = obj.y - obj.radius
    local obj_bottom = obj.y + obj.radius

    if self_right > obj_left
    and self_left < obj_right
    and self_bottom > obj_top
    and self_top < obj_bottom then
        self.dead = true 
        score.score = score.score + 1
    end

    if self_bottom < 0 then
        self.dead = true
    end
end