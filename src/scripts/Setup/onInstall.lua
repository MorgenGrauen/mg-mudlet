function onInstall(_, packageName)
    -- alles was NUR direkt nach der Installation des MG Pakets ausgeführt werden soll
    if packageName ~= "@PKGNAME@" then return end

    mudlet = mudlet or {}
    mudlet.mapper_script = true

    tempTimer(0, function()
        initGMCP("", "GMCP")

        initGUI()

        cecho("<LimeGreen>[  OK  ]  - <gold>Dein Mudlet-Paket fürs MorgenGrauen wurde erfolgreich installiert.\n")
    end)
end
