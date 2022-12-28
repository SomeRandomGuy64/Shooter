Player = Entity:extend()

function Player:new(x, y)
    Player.super.new(self, x, y)
    self.speed = 325
    self.width = 10
    self.height = 10
end

function Player:update(dt)
    Player.super.update(self, dt)

    if love.keyboard.isDown("left") then
        self.x = self.x - self.speed * dt
        if self.x < 0 then
            self.x = 0
        end
    end
    if love.keyboard.isDown("right") then
        self.x = self.x + self.speed * dt
        if self.x > 480 - self.width then
            self.x = 480 - self.width
        end
    end
    if love.keyboard.isDown("up") then
        self.y = self.y - self.speed * dt
        if self.y < 0 then
            self.y = 0
        end
    end
    if love.keyboard.isDown("down") then
        self.y = self.y + self.speed * dt
        if self.y > 640 - self. height then
            self.y = 640 - self.height
        end
    end
end

function Player:draw()
    Player.super.update(self)
    --sets colour to white
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

--Creates bullets when the spacebar is pressed ------------------
function Player:keyPressed(key)
    if key == "space" then
        table.insert(listOfBullets, Bullet(self.x, self.y))
    end
end