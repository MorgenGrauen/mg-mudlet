function GUIReset()

    resetProfile()

    initGUI() -- Hier noch die alte krrrcks Statuszeile
    -- TODO: Bald wird initGUI() stattdessen die komplette GUI bauen.
    -- Dann sind die folgenden Zeilen vmtl. obsolet und Teil von dort:
    initMapperbox()
    initChatbox()
    initDrache()

    initGMCP("", "GMCP")

end