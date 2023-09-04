function checkCollision(entity1, entity2)
    local x1, y1, w1, h1 = entity1.x, entity1.y, entity1.width, entity1.height
    local x2, y2, w2, h2 = entity2.x, entity2.y, entity2.width, entity2.height

    -- print(x1, x2, y1, y2, w2, h2)
    -- print(x1 > x2, x1 < x2 + w2, x1, x2)
    print(y1 > y2, y1 < y2 + h2, y1, y2)
    if ((x1 > x2 and x1 < x2 + w2) or (x2 > x1 and x2 < x1 + w1)) and ((y1 > y2 and y1 < y2 + h2) or (y2 > y1 and y2 < y1 + h1)) then
        return true
    else
        return false
    end
end

function debug(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. debug(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end
