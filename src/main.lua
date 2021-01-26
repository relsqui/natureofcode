local states = require("states")

local currentState = states.firstState

function love.load(arg)
  currentState:load(arg)
end

function love.update(dt)
  currentState:update(dt)
end

function love.draw()
  currentState:draw()
end

--[[
function love.mousepressed(x, y, button)
  currentState:mousepressed(round(x/settings.graphics.scale), round(y/settings.graphics.scale), button)
end

function love.mousemoved(x, y, dx, dy)
  currentState:mousemoved(round(x/settings.graphics.scale), round(y/settings.graphics.scale))
end

function love.mousereleased(x, y, button)
  currentState:mousereleased(round(x/settings.graphics.scale), round(y/settings.graphics.scale), button)
end

function love.wheelmoved(x, y)
  currentState:wheelmoved(x, y)
end

function love.quit()
  currentState:quit()
end
]]