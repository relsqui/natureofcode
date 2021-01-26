local mover = require("mover")
local vector = require("vector")

local rabbit = {}

function rabbit.new(x, y)
  local r = mover.new(x, y)
  r.radius = 12
  r.hopChance = 0.04
  r.hopAcc = 10
  r.hopSlowdown = -0.08
  r.maxVel = 10
  r.maxAcc = 10
  r.minMag = 0.1
  function r:update(dt)
    if self.vel:mag() < self.minMag then
      self.vel:setMag(0)
    end
    if self.vel:mag() > 0 then
      self.acc = vector.new(self.vel.x * self.hopSlowdown, self.vel.y * self.hopSlowdown)
    else
      if math.random() < self.hopChance then
        self.acc = vector.new(math.random() - 0.5, math.random() - 0.5)
        self.acc:mul(self.hopAcc)
      else
        self.acc:setMag(0)
      end
    end
    -- print(self.vel, self.acc)
    self.__index.update(r, dt)
  end
  return r
end

return rabbit