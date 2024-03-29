Player = Entity:extend()

function Player:new(x, y)
    Player.super.new(self, x, y)
    self.speed = 325
    self.diagonalSpeed = math.sqrt((self.speed^2)*2)/2
    self.radius = 5
    self.score = 0
    self.time = 100
    self.shootTiming = 0
    self.shootSpeed = 1
    self.timeSpeed = 1
    self.oldTiming = 0
    self.timeDifference = 0
end

function Player:update(dt)
    Player.super.update(self, dt)
    --timer ------------------
    if self.time > 0 then
        self.time = self.time - self.timeSpeed * dt
    end

    --shoot timer ------------------
    self.timeDifference = self.shootTiming - self.oldTiming
    if self.timeDifference >= 0.05 then
        self.oldTiming = self.shootTiming
    end
    self.shootTiming = self.shootTiming + self.shootSpeed * dt

    --shooting bullets -----------
    if love.keyboard.isDown("space") then
        if self.timeDifference >= 0.05 then
            table.insert(listOfBullets, Bullet(self.x, self.y))
        end
    end

--controls -- also detects when the player is on the edge of the screen
    if love.keyboard.isDown("left") and love.keyboard.isDown("up") then
        self.x = self.x - self.diagonalSpeed * dt
        self.y = self.y - self.diagonalSpeed * dt
        if self.x - self.radius < 0 then
            self.x = self.radius
        end
        if self.y - self.radius < 0 then
            self.y = self.radius
        end
    elseif love.keyboard.isDown("left") and love.keyboard.isDown("down") then
        self.x = self.x - self.diagonalSpeed * dt
        self.y = self.y + self.diagonalSpeed * dt
        if self.x - self.radius < 0 then
            self.x = self.radius
        end
        if self.y > 640 - self.radius then
            self.y = 640 - self.radius
        end
    elseif love.keyboard.isDown("right") and love.keyboard.isDown("up") then
        self.x = self.x + self.diagonalSpeed * dt
        self.y = self.y - self.diagonalSpeed * dt
        if self.x > 480 - self.radius then
            self.x = 480 - self.radius
        end
        if self.y - self.radius < 0 then
            self.y = self.radius
        end
    elseif love.keyboard.isDown("right") and love.keyboard.isDown("down") then
        self.x = self.x + self.diagonalSpeed * dt
        self.y = self.y + self.diagonalSpeed * dt
        if self.x > 480 - self.radius then
            self.x = 480 - self.radius
        end
        if self.y > 640 - self.radius then
            self.y = 640 - self.radius
        end
    else
        if love.keyboard.isDown("left") then
            self.x = self.x - self.speed * dt
            if self.x - self.radius < 0 then
                self.x = self.radius
            end
        end
        if love.keyboard.isDown("right") then
            self.x = self.x + self.speed * dt
            if self.x > 480 - self.radius then
                self.x = 480 - self.radius
            end
        end
        if love.keyboard.isDown("up") then
            self.y = self.y - self.speed * dt
            if self.y - self.radius < 0 then
                self.y = self.radius
            end
        end
        if love.keyboard.isDown("down") then
            self.y = self.y + self.speed * dt
            if self.y > 640 - self.radius then
                self.y = 640 - self.radius
            end
        end
    end
end

function Player:draw()
    Player.super.draw(self)
    --sets colour to white
    love.graphics.setColor(1,1,1)
    love.graphics.circle("fill", self.x, self.y, self.radius)
    love.graphics.print("Score: " .. self.score, 0, 0)
    love.graphics.print("Time: " .. math.ceil(self.time), 0, 30)
end

--Creates bullets when the spacebar is pressed ------------------
function Player:keyPressed(key)
    if key == "space" then
        table.insert(listOfBullets, Bullet(self.x, self.y))
    end
end