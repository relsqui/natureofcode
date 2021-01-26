local mover = require("mover")
local vector = require("vector")

local snake = {}

function snake.new(x, y)
  local s = mover.new(x, y)
  s.newGoalChance = 0.005
  s.goalMag = 0.1
  s.goalAcc = vector.new(s.goalMag, 0)
  s.slitherDir = 1
  s.slitherCounter = 0
  s.slitherSpeed = 0.4 -- seconds
  s.slitherMag = 0.22
  function s:update(dt)
    if math.random() < self.newGoalChance then
      self.goalAcc:add(vector.new(math.random() - 0.5, math.random() - 0.5))
      self.goalAcc:setMag(self.goalMag)
    end
    self.slitherCounter = self.slitherCounter + dt
    if self.slitherCounter > self.slitherSpeed then
      self.slitherDir = -self.slitherDir
      self.slitherCounter = self.slitherCounter - self.slitherSpeed
    end
    local slither = vector.new(self.goalAcc.y * self.slitherDir, self.goalAcc.x * -self.slitherDir)
    slither:setMag(self.slitherMag)
    self.acc = vector.new()
    self.acc:add(self.goalAcc)
    self.acc:add(slither)
    self.__index.update(self, dt)
  end
  return s
end

return snake