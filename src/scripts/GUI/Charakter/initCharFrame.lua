function initCharFrame()
  local frameHeight = 80
  GUI.Char.Frame = Adjustable.Container:new({
    name = "GUI.Char.Frame",
    x = 0, y = -frameHeight,
    padding = 2, width = 240, height = frameHeight,
    adjLabelstyle = [[
      border-color: rgba(113, 75, 50, 100%);
      border-width: 1px; border-style: solid; border-radius: 10px;
      background-color:rgba(200, 200, 160, 10%);
    ]],
    buttonstyle=[[
      QLabel{ border-radius: 7px; background-color: rgba(140, 140, 140, 20%);}
      QLabel::hover{ background-color: rgba(160, 160, 160, 50%);}
    ]],
    lockStyle = "border",
    buttonFontSize = 8,
    buttonsize = 16,
    titleText = " ",
    titleTxtColor = "SaddleBrown",
    attached = "bottom",
  })

  function GUI.Char.Frame:toggleFixedSize(newStatus)
    if newStatus ~= nil then
      self.FixedSize = not newStatus
    end
    if not self.FixedSize then
      self.connectedToBorder = {}
      self.connectedToBorder.bottom = true
      self.connectedToBorder.left = true
      self.connectedToBorder.top = true
      self.connectedToBorder.right = true
      self:setAbsolute(true)
      self.FixedSize = true
    else
      self.connectedToBorder = {}
      self.FixedSize = false
    end
  end
  GUI.Char.Frame:changeMenuStyle("dark")
  GUI.Char.Frame:toggleFixedSize()
end

function onExitCharGUI()
  -- Workaround, da sonst beim nächsten Laden des Profils das Layout kaputt geht
  --   vgl. https://github.com/Mudlet/Mudlet/issues/5321
  GUI.Char.Frame:toggleFixedSize(false)
end
exitCharHandler = exitCharHandler or
  registerAnonymousEventHandler("sysExitEvent", "onExitCharGUI")
