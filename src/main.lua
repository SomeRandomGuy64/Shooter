_G.love = require ("love")

--load function----------------------------
function love.load()
    Object = require "src.classic"
    require "src.entity"
    require "src.player"
    require "src.bullet"
    
    player = Player(700,635)
    listOfBullets= {}
end

--update function -------------------------
function love.update(dt)
    player:update(dt)

    bulletUpdate(dt)
end

--draw function ---------------------------
function love.draw()
    player:draw()

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
    end
end

--function for drawing --------------------
function bulletDraw()
    for i, v in ipairs(listOfBullets) do
        v:draw()
    end
end