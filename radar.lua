function base(margin, offset)
  local line = love.graphics.line(margin,
  love.graphics.getHeight() - offset,
  love.graphics.getWidth() - margin,
  love.graphics.getHeight() - offset)
  return line
end

function radarTicks(radius, margin, n)
  local l = love.graphics.arc('line', 'open',love.graphics.getWidth()/2, love.graphics.getHeight() - margin, radius, 0, -math.pi)
  return l
end

function marks(x, y, toPrint, offset)
  local l = love.graphics.print(toPrint, x, y - offset)
end

function sonar_pulse(radius, margin, angle)
  x1 = love.graphics.getWidth()/2
  y1 = love.graphics.getHeight() - margin
  x2 = x1 + math.cos(angle)*radius*x1
  y2 = y1 - math.sin(angle)*radius*y1
  if y2 <= y1 then
    local l = love.graphics.line(x1, y1, x2, y2)
    return l
  end
end

function vertical_tick(radius, angle, margin)
  x1 = love.graphics.getWidth()/2
  y1 = love.graphics.getHeight() - margin
  x2 = x1 + math.cos(angle)*radius*x1
  y2 = y1 - math.sin(angle)*radius*y1
  local l = love.graphics.line(x1, y1, x2, y2)
  return l
end

function angle_print(radius, angle, margin)
  x1 = love.graphics.getWidth()/2
  y1 = love.graphics.getHeight() - margin
  x2 = x1 + math.cos(angle)*radius*12
  y2 = y1 - math.sin(angle)*radius*12
  angle_degrees = angle*180/math.pi
  if angle_degrees ~= 180 then
    local l = love.graphics.print(angle_degrees.."º", x2, y2)
    return  l
  end
end
