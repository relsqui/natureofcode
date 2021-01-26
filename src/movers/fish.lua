local mover = require("mover")
local vector = require("vector")

local fish = {}

function fish.new(x, y)
  local f = mover.new(x, y)
  f.turning = 0
  f.turnFreq = 0.02
  f.turnAcc = 0.01
  function f:update(dt)
    if f.turning == 0 then
      f.maxVel = 1
      if math.random() < f.turnFreq then
        f.turning = math.random(3) - 2
      end
    else
      f.maxVel = 0.8
      if math.random() < f.turnFreq then
        f.turning = 0
      end
    end
    if f.turning ~= 0 then
      f.acc = vector.new(f.vel.y * f.turning, f.vel.x * -f.turning)
    end
    f.acc:setMag(f.turnAcc)
    f.__index.update(f, dt)
  end
  return f
end

return fish