function onUninstallPackage(_, packageName)
    if packageName == "MorgenGrauen" then
       MG_Version = nil     -- Paketversion löschen
    end
end