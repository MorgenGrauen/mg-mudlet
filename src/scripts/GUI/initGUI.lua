function initGUI()
  initChat()
  initMapperbox()
  initMapOverlay()
  fixRightBorder()
  initDrache()
  initCharGUI()
end

function fixRightBorder()
  GUI.Karte.Frame:connectToBorder("top")
  GUI.Karte.Frame:connectToBorder("bottom")

  GUI.Chat.Frame:connectToBorder("top")
  GUI.Chat.Frame:connectToBorder("bottom")
end