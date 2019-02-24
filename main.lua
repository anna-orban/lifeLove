function love.load()
    love.graphics.setBackgroundColor(1, 1, 1)
    cellSize = 5
    borderSize = 1
    cellDrawSize = cellSize - borderSize
    gridX, gridY = love.graphics.getWidth() / cellSize, love.graphics.getHeight() / cellSize

    grid = {}

    for y = 1, gridY do
        grid[y] = {}
        for x = 1, gridX do
            grid[y][x] = false
        end
    end

-- Temp
    grid[1][1] = true
    grid[1][2] = true
end

function love.update()
    selectedX = math.floor(love.mouse.getX() / cellSize) + 1
    selectedY = math.floor(love.mouse.getY() / cellSize) + 1

    if love.mouse.isDown(1) and selectedX <= gridX and selectedY <= gridY then
        grid[selectedY][selectedX] = true
    end
end

function love.draw()
    for y = 1, gridY do
        for x = 1, gridX do
            if x == selectedX and y == selectedY then
                love.graphics.setColor(0, 1, 1)
            elseif grid[y][x] then
                love.graphics.setColor(1, 0, 1)
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

--Temp
    love.graphics.setColor(0, 0, 0)
    love.graphics.print('selected x: '..selectedX..', selected y: '..selectedY)
end

function love.mousepressed(mouseX, mouseY, button)
    if button == 2 then
        local neighbourCount = 0

        print('Finding neighbors of grid['..selectedY..']['..selectedX..']')

        for dy = -1, 1 do
            for dx = -1, 1 do   
                print('Checking grid['..selectedY + dy..']['..selectedX + dx..']')
                if not (dy == 0 and dx ==0) and grid[selectedY + dy] and grid[selectedY + dy][selectedX + dx] then
                    print('Neighbour found')
                    neighbourCount = neighbourCount + 1
                end
            end
        end
        print('Total neighbors: '..neighbourCount)
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit(0)
    end
end