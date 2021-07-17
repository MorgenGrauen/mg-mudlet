function initAttribs()
  -- tbd
end

function oldAttribs()  
  if showAttribs then
    AttribsFrame = Geyser.Container:new({
      name = "AttribsFrame",
      x = 0, y = 0, padding = 0,width = 33, height = 33,
    }, CharFrame)
    AttribsLabel = Geyser.Label:new({
      name = "AttribsLabel", fgColor = "black",
      x = 0, y = 0, width = "100%", height = "100%", 
      message = [[<center>20&nbsp;10<br>&nbsp;5&nbsp;&nbsp;2</center>]]
    }, AttribsFrame)
    AttribsLabel:setStyleSheet([[
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