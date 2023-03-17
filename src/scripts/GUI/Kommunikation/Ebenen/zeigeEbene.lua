function zeigeEbene()
    if not table.is_field(gmcp, "comm.channel") then return end

    local commData = gmcp.comm.channel
    local chan = commData.chan
    local player = commData.player
    local msg = commData.msg
    local bunterText = liefereFarbigeEbene(msg, player, chan)

    if GUI.Chatbox.Config.Ebenen.ShowInWindow then
        GUI.Chatbox.EMCO:hecho("Ebenen", bunterText)
    end

    if GUI.Chatbox.Config.Ebenen.ShowInMain then
        hecho("main", bunterText)
    end
end