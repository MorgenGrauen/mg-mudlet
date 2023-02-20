function zeigeEbene()
    if not table.is_field(gmcp, "comm.channel") then return end

    if GUI.Chatbox.Config.Ebenen.ShowInWindow then
        local bunterText = liefereFarbigenText("ebenen", gmcp.comm.channel.msg)
        GUI.Chatbox.EMCO:echo("Ebenen", bunterText)
    end

    if GUI.Chatbox.Config.Ebenen.ShowInMain then
        faerbeText("ebenen", gmcp.comm.channel.msg)
    end
end