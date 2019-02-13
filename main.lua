function love.load()
    love.graphics.setBackgroundColor(1, 1, 1)
    cellSize = 5
    borderSize = 1
    cellDrawSize = cellSize - borderSize
    gridX, gridY = love.graphics.getWidth() / cellSize, love.graphics.getHeight() / cellSize
end

function love.update()
    selectedX = math.floor(love.mouse.getX() / cellSize) + 1
    selectedY = math.floor(love.mouse.getY() / cellSize) + 1
end

function love.draw()
    for y = 1, gridY do
        for x = 1, gridX do
            if x == selectedX and y == selectedY then
                love.graphics.setColor(0, 1, 1)
            else
                love.graphics.setColor(0.86, 0.86, 0.86)
            end
            love.graphics.rectangle(
                'fill',
                (x - 1) * cellSize,
                (y - 1) * cellSize,
                cellDrawSize,
                cellDrawSize
            )
        end
    end

    love.graphics.setColor(0, 0, 0)
    love.graphics.print('selected x: '..selectedX..', selected y: '..selectedY)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit(0)
    end
end