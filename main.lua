function love.load()
    love.graphics.setBackgroundColor(1, 1, 1)
    cellSize = 5
    borderSize = 1
    cellDrawSize = cellSize - borderSize
    gridX, gridY = love.graphics.getWidth() / cellSize, love.graphics.getHeight() / cellSize
end

function love.draw()
    for y = 1, gridY do
        for x = 1, gridX do
        love.graphics.setColor(0.86, 0.86, 0.86)
        love.graphics.rectangle(
            'fill',
            (x - 1) * cellSize,
            (y - 1) * cellSize,
            cellDrawSize,
            cellDrawSize
        )
        end
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit(0)
    end
end