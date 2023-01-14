function initAttribs()
  -- tbd
end

function oldAttribs()  
  local showAttribs = ME.report_attribs
  if showAttribs then
    GUI.AttribsFrame = Geyser.Container:new({
      name = "AttribsFrame",
      x = 0, y = 0, padding = 0,width = 33, height = 33,
    }, GUI.CharFrame)
    GUI.AttribsLabel = Geyser.Label:new({
      name = "AttribsLabel", fgColor = "black",
      x = 0, y = 0, width = "100%", height = "100%", 
      message = [[<center>20&nbsp;10<br>&nbsp;5&nbsp;&nbsp;2</center>]]
    }, GUI.AttribsFrame)
    GUI.AttribsLabel:setStyleSheet([[
      border-color: rgba(0,0,0,0%);
      border-width: 0px; border-style: solid; border-radius: 10px;
      background-color: rgba(201,180,123,100%);
      font-size: 10pt;
    ]])
  else
    if AttribsFrame then AttribsFrame:hide() end
    if AttribsLabel then AttribsLabel:hide() end
  end
end