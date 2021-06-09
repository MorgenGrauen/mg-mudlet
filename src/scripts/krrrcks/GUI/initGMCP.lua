function initGMCP() 
    local debugLevel = 0 -- 0 zeigt nichts, 100 zeigt alles, 20 etwas, usw.
    sendGMCP( f"Core.Debug {debugLevel} ")
    sendGMCP( [[Core.Supports.Set [ "MG.char 1", "MG.room 1", "comm.channel 1" ] ]])
end
