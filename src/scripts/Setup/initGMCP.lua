function initGMCP(_, protocol)
    if protocol == "GMCP" then
        local debugLevel = 0 -- 0 zeigt nichts, 100 zeigt alles, 20 etwas, usw.
        sendGMCP( f"Core.Debug {debugLevel} ")
        sendGMCP( [[Core.Supports.Set [ "MG.char 1", "MG.room 1", "comm.channel 1" ] ]])
    end
end

function GMCP_Char_deaktivieren(_)
    -- gmcp.Char wird bei Login dreimal empfangen: StatusVars, Status, Vitals
    -- Hintergrund ist, dass Mudlet das automatisch im GMCP Handshake anfordert.
    -- Dies ist unabhängig von ggf. Lua Skripten und fragt immer nach "Char".
    -- Hintergrund ist gewünschtes "einfaches, out-of-the-box" Erlebnis bei vielen Spielen.
    -- Passt aber nicht zu MG.char also werden wir den Inhalt wieder löschen.
    -- Damit wir nicht dreimal löschen, hier ein Timer mit Wartezeit von null Sekunden.

    if not GMCP_Char_Timer then 
      GMCP_Char_Timer = tempTimer(0, function()
        GMCP_Char_Timer = nil
        gmcp.Char = nil
        -- debugText("GMCP Char deaktiviert!")
      end)
    end 
  end

registerAnonymousEventHandler("sysProtocolEnabled", "initGMCP")
registerAnonymousEventHandler("gmcp.Char", "GMCP_Char_deaktivieren")