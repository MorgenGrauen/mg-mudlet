function onInstall(_, packageName)
    -- alles was NUR direkt nach der Installation des MG Pakets ausgeführt werden soll
    if not packageName == "@PKGNAME@" then return end

    -- Entfernt Mudlets "generic mapper" Paket, das uns stört
    uninstallPackage("generic_mapper")

    mudlet = mudlet or {}
    mudlet.mapper_script = true

    tempTimer(0, function()
        initGMCP("", "GMCP")

        initGUI()

        cecho("<LimeGreen>[  OK  ]  - <gold>Dein Mudlet-Paket fürs MorgenGrauen wurde erfolgreich installiert.\n")
    end)
end
