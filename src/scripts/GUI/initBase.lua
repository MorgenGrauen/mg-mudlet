function initBase() 
    ME.name = gmcp.MG.char.base.name 
    ME.stufe = gmcp.MG.char.info.level

    if not GUI.angezeigt then
        initGUI()
        initCharGUI()
        GUI.angezeigt = true
    end
end
