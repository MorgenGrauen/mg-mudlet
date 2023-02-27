function initAttribs()
  -- tbd
end

function oldAttribs()  
  local showAttribs = ME.report_attribs
  if showAttribs then
    GUI.Char.AttribsFrame = Geyser.Container:new({
      name = "AttribsFrame",
      x = 0, y = 0, padding = 0,width = 33, height = 33,
    }, GUI.Char.Frame)
    GUI.Char.AttribsLabel = Geyser.Label:new({
      name = "AttribsLabel", fgColor = "black",
      x = 0, y = 0, width = "100%", height = "100%", 
      message = [[<center>20&nbsp;10<br>&nbsp;5&nbsp;&nbsp;2</center>]]
    }, GUI.Char.AttribsFrame)
    GUI.Char.AttribsLabel:setStyleSheet([[
      border-color: rgba(0, 0, 0, 0%);
      border-width: 0px; border-style: solid; border-radius: 10px;
      background-color: rgba(201, 180, 123, 100%);
      font-size: 10pt;
    ]])
  else
    if AttribsFrame then GUI.Char.AttribsLabel:hide() end
    if AttribsLabel then GUI.Char.AttribsLabel:hide() end
  end
end