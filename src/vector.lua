local vector = {}


local metaVector = {}
function metaVector:add(w)
  self.x = self.x + w.x
  self.y = self.y + w.y
  self.z = self.z + w.z
end
function metaVector:sub(w)
  self.x = self.x - w.x
  self.y = self.y - w.y
  self.z = self.z - w.z
end
function metaVector:mul(s)
  self.x = self.x * s
  self.y = self.y * s
  self.z = self.z * s
end
function metaVector:div(s)
  self.x = self.x / s
  self.y = self.y / s
  self.z = self.z / s
end

function metaVector:limit(s)
  if self:mag() > s then
    self:setMag(s)
  end
end
function metaVector:mag()
  return math.sqrt(self.x^2 + self.y^2 + self.z^2)
end
metaVector.getMag = metaVector.mag
function metaVector:setMag(m)
  self:norm()
  self:mul(m)
end
function metaVector:norm()
  local m = self:mag()
  if m ~= 0 then
    self:div(m)
  end
end


function vector.new(x, y, z)
  local v = {
    __index = metaVector;
    __tostring = function (self) return "(" .. self.x .. ", " .. self.y .. ", " .. self.z .. ")" end;
    x = x or 0;
    y = y or 0;
    z = z or 0;
  }
  setmetatable(v, v)
  return v
end


return vector