local mover = require("mover")
local fish = require("movers/fish")
local fly = require("movers/fly")
local rabbit = require("movers/rabbit")
local snake = require("movers/snake")

local gameState = {}

function gameState:load(arg)
  self.w, self.h, self.flags = love.window.getMode()
  self.movers = {
    fish.new(100, 100);
    fly.new(100, 200);
    rabbit.new(100, 300);
    snake.new(100, 400);
  }
end

function gameState:update(dt)
  for _, m in ipairs(self.movers) do
    m:update(dt)
  end
end

function gameState:draw()
  love.graphics.setColor({0.4, 0.5, 0.95})
  love.graphics.rectangle("fill", 0, 0, self.w, self.h)
  for _, m in ipairs(self.movers) do
    m:draw()
  end
end

return gameState