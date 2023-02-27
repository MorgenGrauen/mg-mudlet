function initStufe()
  GUI.Char.StufeFrame = Geyser.Container:new({
    name = "StufeFrame",
    x = 57, y = 57, padding = 0,width = 17, height = 17,
  }, GUI.Char.Frame)
  GUI.Char.StufeLabel = Geyser.Label:new({
    name = "StufeLabel", fgColor = "black",
    x = 0, y = 0, width = "100%", height = "100%",
  }, GUI.Char.StufeFrame)
  GUI.Char.StufeLabel:setStyleSheet(f([[
    border-color: rgba(0, 0, 0, 0%);
    border-width: 0px; border-style: solid; border-radius: 8px;
    background-color: rgba(201, 180, 123, 100%);
  ]]))
  GUI.Char.StufeLabel:enableClickthrough()
  GUI.Char.StufeLabel:hide()
  registerAnonymousEventHandler("gmcp.MG.char.info.level", showStufe, false)
end

function showStufe()  
  if ME.stufe < 10 then 
    GUI.Char.stufeSize = 10
  elseif ME.stufe < 100 then
    GUI.Char.stufeSize = 8
  else
    GUI.Char.stufeSize = 6 -- Länge 3 braucht Size 6, 2 kann 8, 1 kann 10
  end
  
  GUI.Char.StufeLabel:echo(f"<center>{ME.stufe}</center>")
  GUI.Char.StufeLabel:setFontSize(GUI.Char.stufeSize) 
  GUI.Char.StufeLabel:show()
end