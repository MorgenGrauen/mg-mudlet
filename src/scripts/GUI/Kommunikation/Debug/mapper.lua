function echoM(text)
    local bunterText = liefereFarbigenText("mapper", "[MAPPER]  - " .. text .. "\n")
    if GUI.Chat.EMCO then
        GUI.Chat.EMCO:cecho("Debug", bunterText)
    else
        -- Anscheinend wurde EMCO (noch?) nicht eingerichtet - schreibe dann ins Hauptfenster
        cecho("Debug", bunterText)
    end
end
