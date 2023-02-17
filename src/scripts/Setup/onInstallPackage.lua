function onInstallPackage(_, packageName)
    -- alles was NUR direkt nach der Installation des MG Pakets ausgeführt werden soll
    if not packageName == "@PKGNAME@" then return end

    initGMCP("", "GMCP")

    initMapperbox()
    initChatbox()

    cecho("<LimeGreen>[  OK  ]  -<gold> Dein Mudlet-Paket fürs MorgenGrauen wurde erfolgreich installiert.\n")

end
