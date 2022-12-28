Player = Entity:extend()

function Player:new(x, y)
    Player.super.new(self, x, y)
    self.speed = 200
end

function Player:update(dt)
    Player.super.update(self, dt)

    if love.keyboard.isDown("left") then
        self.x = self.x - self.speed * dt
    end
    if love.keyboard.isDown("right") then
        self.x = self.x + self.speed * dt
    end
end

function Player:draw()
    Player.super.update(self)
    love.graphics.rectangle("fill", self.x, self.y, 10, 10)
end

--Creates bullets when the spacebar is pressed ------------------
function Player:keyPressed(key)
    if key == "space" then
        table.insert(listOfBullets, Bullet(self.x, self.y))
    end
end