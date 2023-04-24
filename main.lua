_G.love = require ("love")

--load function----------------------------
function love.load()
    Object = require "classic"
    require "entity"
    require "player"
    require "bullet"
    require "enemy"
    
    player = Player(245,620)
    enemy = Enemy(0,0)
    listOfBullets = {}
    love.graphics.setBackgroundColor(0,0.66,0)
end

--update function -------------------------
function love.update(dt)
    player:update(dt)
    enemy:update(dt)

    bulletUpdate(dt)
end

--draw function ---------------------------
function love.draw()
    player:draw()
    enemy:draw()

    bulletDraw()
end

--key press for shooting ------------------
function love.keypressed(key)
    player:keyPressed(key)
end

--function for updating bullets -----------
function bulletUpdate(dt)
    for i, v in ipairs(listOfBullets) do
        v:update(dt)
        v:checkCollision(enemy, player)
        if v.dead then
            table.remove(listOfBullets, i)
        end
    end
end

--function for drawing --------------------
function bulletDraw()
    for i, v in ipairs(listOfBullets) do
        v:draw()
    end
end