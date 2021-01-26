local mover = require("mover")
local vector = require("vector")

local fly = {}

function fly.new(x, y)
  local f = mover.new(x, y)
  f.radius = 4
  f.meander = 0.6
  f.dartAcc = 3
  f.dartChance = 0.05
  f.dartStopChance = 0.05
  f.maxAcc = 2
  f.maxVel = 4
  function f:update(dt)
    if f.acc:mag() < 1 or math.random() < f.dartStopChance then
      f.acc = vector.new(math.random() - 0.5, math.random() - 0.5)
      if math.random() < f.dartChance then
        f.maxVel = 4
        f.acc:setMag(f.dartAcc)
      else
        f.maxVel = 2
        f.acc:setMag(f.meander)
      end
    end
    f.__index.update(f, dt)
  end
  return f
end

return fly