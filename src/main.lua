
--Once ever
love.load = function()
    mainVars = {
        camera = {
            pos = {
                x = 0,
                y = 0,
                z = 4,
            },
            border = {
                x = love.graphics.getWidth(),
                y = love.graphics.getHeight(),
            }
        }, env = {
            map = {
                grid = {
                    edgeColor = {
                        r= 31/51,
                        g = 173/255,
                        b = 178/255,
                        a = 1,
                    },
                    bodyColor = {
                        1,
                        1,
                        1,
                        1,
                    },
                    size = 256,
                    apparentSize = 0
                }
            }
        }
    }
end

--Once per frame
love.update = function()
    love.graphics.setColor(mainVars.env.map.grid.edgeColor.r, mainVars.env.map.grid.edgeColor.g, mainVars.env.map.grid.edgeColor.b, mainVars.env.map.grid.edgeColor.a)
    mainVars.env.map.grid.apparentSize = mainVars.env.map.grid.size/mainVars.camera.pos.z
    mainVars.camera.pos.x = mainVars.camera.pos.x + 1
    mainVars.camera.pos.y = mainVars.camera.pos.y + 1
    --mainVars.camera.pos.z = mainVars.camera.pos.z + 0.1
end

--Graphics
love.draw = function()
    love.graphics.clear(mainVars.env.map.grid.bodyColor)
    love.graphics.setLineWidth(mainVars.env.map.grid.apparentSize/6)
    for x = -((mainVars.camera.pos.x)%(mainVars.env.map.grid.apparentSize*mainVars.camera.pos.z))/mainVars.camera.pos.z,mainVars.camera.border.x + mainVars.env.map.grid.apparentSize,mainVars.env.map.grid.apparentSize do
        love.graphics.line(x, 0, x, mainVars.camera.border.y)
    end
    for y = ((mainVars.camera.pos.y)%(mainVars.env.map.grid.apparentSize*mainVars.camera.pos.z))/mainVars.camera.pos.z,mainVars.camera.border.y + mainVars.env.map.grid.apparentSize,mainVars.env.map.grid.apparentSize do
        love.graphics.line(0, y, mainVars.camera.border.x, y)
    end
end