function love.load(arg)
  -- body...
  require('radar')
  start_radius = 30
  n_ticks = 20
  base_y = 30
  myFont = love.graphics.newFont(20)
  sonar_radius = start_radius
  base_r = sonar_radius
  pulse_range = 95
  time = 0
  freq = 0
  period = 0
  direction = -1
  angle = math.pi
end


function love.update(dt)
  -- body...
  sonar_radius = sonar_radius + base_r * dt * 20
  angle = angle + 0.01*direction
  time = time + dt
  if angle >= math.pi then
    period = time
    freq = 1 / time
    time = 0
    direction = -1
  elseif angle <= 0 then
    direction = 1
    period = time
    freq = 1 / time
    time = 0
  end

end


function love.draw()
  -- body...
  love.graphics.setBackgroundColor(0, 0, 0, 1)
  love.graphics.setColor(0, 255, 0, 90)
  base(0, base_y)
  ticks = math.pi/n_ticks
  --Radar ticks
  for i = n_ticks, 1, -1 do
    love.graphics.setColor(0, 255, 0, 100)
    love.graphics.setLineWidth(1)
    radarTicks(start_radius * i ,base_y, 4)
    vertical_tick(start_radius * i, ticks * i, base_y)
    love.graphics.setColor(0, 255, 0)
    angle_print(start_radius, ticks*i, base_y)
  end

  --distance Marks
  love.graphics.setShader()
  for i = 1, n_ticks do
    love.graphics.setColor(255, 0, 0)
    local pos = i * start_radius
    if i % 2 == 0 and i ~= n_ticks then
      marks(love.graphics.getWidth()/2, pos, love.graphics.getHeight() - pos, base_y/2)
    end
  end

  --Sonar
  sonar_alpha = 100
  for i = pulse_range, 1, -1 do
    love.graphics.setColor(0, 255, 0, sonar_alpha - i)
    love.graphics.setLineWidth(3)
    sonar_pulse(500, base_y, angle + -1 * direction * i/pulse_range)
  end
  -- Textos
  love.graphics.setColor(0, 255, 0)
  love.graphics.print("Frequencia: ", 30, love.graphics.getHeight() - base_y + 10)
  love.graphics.print("Detectados: ", 150, love.graphics.getHeight() - base_y + 10)
  love.graphics.print("Periodo: ", 300, love.graphics.getHeight() - base_y + 10)
  love.graphics.print("Autor: ", 500, love.graphics.getHeight() - base_y + 10)

  --Numeros
  love.graphics.setColor(255, 0, 0)
  love.graphics.print(string.format("%.2f", freq), 110, love.graphics.getHeight() - base_y + 10)
  --love.graphics.print("Detectados: ", 150, love.graphics.getHeight() - base_y + 10)
  love.graphics.print(string.format("%.2f", period), 360, love.graphics.getHeight() - base_y + 10)
  love.graphics.print("Thiago Boeker", 560, love.graphics.getHeight() - base_y + 10)

end
