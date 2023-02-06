function initBase() 
  if not ( table.is_field(gmcp, "MG.char.base") and 
           table.is_field(gmcp, "MG.char.info") ) then return end

    ME.name = gmcp.MG.char.base.name
    ME.stufe = gmcp.MG.char.info.level

    if not GUI.angezeigt then
        initGUI()
        initCharGUI()
        GUI.angezeigt = true
    end
  end
end
