function onInstallPackage(_, packageName)
    if packageName == "MorgenGrauen" then
        -- hier kommt alles rein das NUR direkt nach der Installation des MG Pakets
        -- ausgeführt werden soll

        initGMCP("", "GMCP")

        initEMCO()
    end
end