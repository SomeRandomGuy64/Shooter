_G.love = require ("love")

function love.load()
    Object = require "src.classic"
    require "src.entity"
    require "src.player"
    require "src.bullet"
    
    player = Player(700,635)
    listOfBullets= {}
end

function love.update(dt)
    player:update(dt)

    bulletUpdate(dt)
end

function love.draw()
    player:draw()

    bulletDraw()
end

function love.keypressed(key)
    player:keyPressed(key)
end

function bulletUpdate(dt)
    for i, v in ipairs(listOfBullets) do
        v:update(dt)
    end
end

function bulletDraw()
    for i, v in ipairs(listOfBullets) do
        v:draw()
    end
end