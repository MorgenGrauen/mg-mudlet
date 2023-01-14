function initCharFrame()

  GUI.CharFrame = Adjustable.Container:new({
    name = "CharFrame",
    x = 100, y = 100, 
    padding = 2, width = 240, height = 80,
    adjLabelstyle = [[ 
      border-color: rgba(113,75,50,100%);
      border-width: 1px; border-style: solid; border-radius: 10px; 
      background-color:rgba(200,200,160,10%);
    ]],
    buttonstyle=[[
      QLabel{ border-radius: 7px; background-color: rgba(140,140,140,20%);}
      QLabel::hover{ background-color: rgba(160,160,160,50%);}
    ]],
    buttonFontSize = 8,
    buttonsize = 16,
    titleText = " ",
    titleTxtColor = "SaddleBrown",
  })
    
  function GUI.CharFrame:toggleFixedSize()
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
  GUI.CharFrame:toggleFixedSize() 
end