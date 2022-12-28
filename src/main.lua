_G.love = require ("love")

function love.load()
    Object = require "src.classic"
    require "src.entity"
    require "src.player"
    
    player = Player(700,635)
end

function love.update(dt)
    player:update(dt)
end

function love.draw()
    player:draw()
end