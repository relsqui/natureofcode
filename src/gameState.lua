local fish = require("movers/fish")
local mover = require("mover")

local gameState = {}

function gameState:load(arg)
  self.w, self.h, self.flags = love.window.getMode()
  self.movers = {
    -- mover.new(0, 100);
    fish.new(0, 200);
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