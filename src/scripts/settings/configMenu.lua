-- Einstellungsdialog

local menuData = nil

function createConfigMenu(caption, data)
    return {
        caption = caption,
        lines = data
    }
end

function testMenu()
    local menu = createConfigMenu("Automapper", {
        {
            lineNumber = -1,
            configID = "mapper.roomDistance",
            caption = "Abstand zwischen den Raeumen",
            desc = "Langer Text hier als Beschreibung\nHoffentlich auch mehrzeilig...",
            format = function (value)
                if value > 1 then
                    return string.format("%d Felder", value)
                end

                return "1 Feld"
            end,
            switchValue = function (value)
                if value == 1 then
                    return 2
                else
                    return 1
                end
            end
        },
        {
            lineNumber = -1,
            configID = "mapper.messageColor",
            caption = "Farbe der Meldungen",
            desc = "Farbe der Meldungen",
            format = function (value)
                return string.format("<%s>%s<reset>", value, value)
            end,
            widget = function (index, value)
                showColorChooser(index)
            end
        },
        {
            lineNumber = -1,
            configID = "mapper.showMap",
            caption = "Kartenfenster anzeigen",
            desc = "Soll das Kartenfenster angezeigt werden",
            format = function (value)
                if value == true then
                    return "<green>ja<reset>"
                end

                return "<red>nein<reset>"
            end,
            switchValue = function (value)
                return not value
            end
        }
    })

    showConfigMenu(menu)
end

function showConfigMenu(data)
    menuData = data

    echo("\n[ Einstellungen: " .. data.caption .. " ]\n\n")

    local maxW = 70

    for index, line in ipairs(menuData.lines) do
        line.lineNumber = getLastLineNumber("main")

        -- Bezeichnung der Einstellung ausgeben
        cecho(string.format("- %-" .. maxW .. "s: ", line.caption))

        -- Wert der Einstellung formatieren
        local value = getConfig(line.configID)
        local formatedValue = ""

        if line.format then
            formatedValue = line.format(value)    
        end

        -- Wert ausgeben
        if line.widget ~= nil then
            -- bei Einstellung mit Widget KEINEN Link erstellen!
            cecho("" .. formatedValue .. "\n")
        else
            cechoLink("<u>" .. formatedValue .. "</u>", "onClickValue(" .. index .. ")", "", true)
            echo("\n")
        end

        -- Beschreibung ausgeben wenn vorhanden
        if line.desc ~= nil and line.desc ~= "" then
            echo("\n")
            for _, dline in pairs(string.split(line.desc, "\n")) do
                cecho(string.format("   <dim_gray>%-" .. maxW .. "s<reset>\n", dline))
            end
            
            echo("\n")
        end

        -- Auswahlwidget anzeigen, falls angegeben
        if line.widget ~= nil then
            line.widget(index, value)
            echo("\n")
        end
    end
end

function onClickValue(index)
    local maxW = 70

    local line = menuData.lines[index]

    moveCursor(0, line.lineNumber)
    selectCurrentLine()
  
    creplaceLine(string.format("- %-" .. maxW .. "s: ", line.caption))
  
    moveCursor(#getCurrentLine(), line.lineNumber)
    
    local value = getConfig(line.configID)
    local formatedValue = ""

    if line.switchValue then
        value = line.switchValue(value)
        setConfig(line.configID, value)
    end

    if line.format then
        formatedValue = line.format(value)    
    end

    cinsertLink("<u>" .. formatedValue .. "</u>", "onClickValue(" .. index .. ")", "", true)
  
    moveCursor(#getCurrentLine(), line.lineNumber)
    cinsertText("\n")
  
    moveCursorEnd()
end

function onSetValue(index, value)
    local maxW = 70

    local line = menuData.lines[index]

    moveCursor(0, line.lineNumber)
    selectCurrentLine()
  
    creplaceLine(string.format("- %-" .. maxW .. "s: ", line.caption))
  
    moveCursor(#getCurrentLine(), line.lineNumber)
    
    setConfig(line.configID, value)
    local formatedValue = ""

    if line.format then
        formatedValue = line.format(value)    
    end

    cinsertText("" .. formatedValue .. "\n")
  
    moveCursorEnd()
end

-- Farbleiste --
-- gediebt aus dem Mudlet Quellcode und an unsere Bedürfnisse angepasst

local sortColorsByHue = function(lhs,rhs)
    local lh,ll,lv = unpack(lhs.sort)
    local rh,rl,rv = unpack(rhs.sort)
    if lh < rh then
      return true
    elseif lh > rh then
      return false
    elseif ll < rl then
      return true
    elseif ll > rl then
      return false
    else
      return lv < rv
    end
end
  
  -- internal sorting function, removes _ from snake_case and compares to camelCase
local sortColorsByName = function(a,b)
    local aname = string.gsub(string.lower(a.configID), "_", "")
    local bname = string.gsub(string.lower(b.configID), "_", "")
    return aname < bname
end

local rgbToHsv = function(r, g, b)
    r, g, b = r / 255, g / 255, b / 255
    local max, min = math.max(r, g, b), math.min(r, g, b)
    local h, s, v
    v = max
  
    local d = max - min
    if max == 0 then
      s = 0
    else
      s = d / max
    end
  
    if max == min then
      h = 0 -- achromatic
    else
      if max == r then
        h = (g - b) / d
        if g < b then h = h + 6 end
      elseif max == g then
        h = (b - r) / d + 2
      elseif max == b then
        h = (r - g) / d + 4
      end
      h = h / 6
    end
  
    return h, s, v
end

local step = function(r,g,b)
    local lum = math.sqrt( .241 * r + .691 * g + .068 * b )
    local reps = 8
  
    local h, s, v = rgbToHsv(r,g,b)
  
    local h2 = math.floor(h * reps)
    local v2 = math.floor(v * reps)
    if h2 % 2 == 1 then
      v2 = reps - v2
      lum = reps - lum
    end
    return h2, lum, v2
end
  
local function calc_luminosity(r,g,b)
    r = r < 11 and r / (255 * 12.92) or ((0.055 + r / 255) / 1.055) ^ 2.4
    g = g < 11 and g / (255 * 12.92) or ((0.055 + g / 255) / 1.055) ^ 2.4
    b = b < 11 and b / (255 * 12.92) or ((0.055 + b / 255) / 1.055) ^ 2.4
    return (0.2126 * r) + (0.7152 * g) + (0.0722 * b)
end

function showColorChooser(index)
    local line = menuData.lines[index]

    local cols = 16

    local colors = {}
    for k, v in pairs(color_table) do
        local color = {}
        color.rgb = v
        color.name = k
        color.sort = {step(unpack(v))}
        -- einen Großteil an Farben (doppelte, Schwarz, Transparent, RGB) gleich rausfiltern
        -- if not string.find(k, "ansi_") and not string.find(k, "%u") and k ~= "black" and k ~= "transparent" then
        
        -- nur ANSI Farben
        if string.find(k, "ansi_") and not string.find(k, "%d") then
        table.insert(colors,color)
        end
    end

    table.sort(colors,sortColorsByHue)
  
    echo("  ")

    local i = 1
    for _, k in ipairs(colors) do
        local v = k.rgb
        local fgc = "white"
      
        if calc_luminosity(v[1],v[2],v[3]) > 0.5 then
            fgc = "black"
        end

        cechoLink(string.format('<%s:%s>___<reset> ',fgc,k.name), [[onSetValue(]] .. index .. [[, "]] .. k.name .. [[")]], k.name, true)
        if i == cols then
            echo("\n  ")
            i = 1
        else
            i = i + 1
        end
    end
  
    if i ~= 1 then echo("\n") end
end
