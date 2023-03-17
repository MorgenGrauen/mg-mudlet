function zeigeMitteilung()

    if GUI.Chat.Config.Mitteilungen.ShowInWindow then
      selectCurrentLine()
      GUI.Chat.EMCO:append("Mitteilungen")
      deselect()
      resetFormat()
    end

    if not GUI.Chat.Config.Mitteilungen.ShowInMain then
      deleteLine()
    end

end