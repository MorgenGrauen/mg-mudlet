function onInstallPackage(_, packageName)
    if packageName == "MorgenGrauen" then
        -- hier kommt alles rein das NUR direkt nach der Installation des MG Pakets
        -- ausgeführt werden soll

        initGMCP("", "GMCP")
        cecho([[<LimeGreen>[  OK  ] -<gold> Dein Mudlet-Paket fürs MorgenGrauen wurde erfolgreich installiert.]])
    end
end
