function initStufe()
  GUI.StufeFrame = Geyser.Container:new({
    name = "StufeFrame",
    x = 57, y = 57, padding = 0,width = 17, height = 17,
  }, GUI.CharFrame)
  GUI.StufeLabel = Geyser.Label:new({
    name = "StufeLabel", fgColor = "black",
    x = 0, y = 0, width = "100%", height = "100%",
  }, GUI.StufeFrame)
  GUI.StufeLabel:setStyleSheet(f([[
    border-color: rgba(0,0,0,0%);
    border-width: 0px; border-style: solid; border-radius: 8px;
    background-color: rgba(201,180,123,100%);
  ]]))
  GUI.StufeLabel:enableClickthrough()
  GUI.StufeLabel:hide()
  registerAnonymousEventHandler("gmcp.MG.char.info.level", showStufe, false)
end

function showStufe()  
  if ME.stufe < 10 then 
    GUI.stufeSize = 10
  elseif ME.stufe < 100 then
    GUI.stufeSize = 8
  else
    GUI.stufeSize = 6 -- Länge 3 braucht Size 6, 2 kann 8, 1 kann 10
  end
  
  GUI.StufeLabel:echo(f"<center>{ME.stufe}</center>")
  GUI.StufeLabel:setFontSize(GUI.stufeSize) 
  GUI.StufeLabel:show()
end