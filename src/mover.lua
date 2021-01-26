local vector = require("vector")

local mover = {}

local metaMover = {}
function metaMover:update()
  self.acc:limit(self.maxAcc)
  self.vel:add(self.acc)
  self.vel:limit(self.maxVel)
  self.pos:add(self.vel)

  local w, h, flags = love.window.getMode()
  if self.pos.x > w then self.pos.x = self.pos.x - w end
  if self.pos.x < 0 then self.pos.x = self.pos.x + w end
  if self.pos.y > h then self.pos.y = self.pos.y - h end
  if self.pos.y < 0 then self.pos.y = self.pos.y + h end
end

function metaMover:draw()
  love.graphics.setColor(self.color)
  love.graphics.circle("fill", self.pos.x, self.pos.y, self.radius)
  love.graphics.setColor(0, 0, 0)
  love.graphics.circle("line", self.pos.x, self.pos.y, self.radius)
end

function mover.new(x, y)
  m = {
    __index = metaMover;
    pos = vector.new(x or 100, y or 100);
    vel = vector.new();
    acc = vector.new(0.05, 0);
    maxVel = 2;
    maxAcc = 0.5;
    color = {1, 1, 1};
    radius = 10;
  }
  setmetatable(m, m)
  return m
end

return mover