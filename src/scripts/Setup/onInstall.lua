function onInstall(_, packageName)
    -- alles was NUR direkt nach der Installation des MG Pakets ausgeführt werden soll
    if not packageName == "@PKGNAME@" then return end

    tempTimer(0, function()
        initGMCP("", "GMCP")

        initMapperbox()
        initChatbox()

        ladeStartgebiet()

        cecho("<LimeGreen>[  OK  ]  -<gold> Dein Mudlet-Paket fürs MorgenGrauen wurde erfolgreich installiert.\n")
    end)
end
