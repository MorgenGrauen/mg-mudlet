function zeigeMitteilung()

    if GUI.Chatbox.Config.Mitteilungen.ShowInWindow then
      selectCurrentLine()
      GUI.Chatbox.EMCO:append("Mitteilungen")
      deselect()
      resetFormat()
    end

    if not GUI.Chatbox.Config.Mitteilungen.ShowInMain then
      deleteLine()
    end

end