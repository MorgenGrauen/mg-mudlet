function onUninstall(_, packageName)
    -- alles was direkt vor der Deinstallation des MG Pakets ausgeführt werden soll
    if not packageName == "@PKGNAME@" then return end

    -- setBorderSizes(0)
    -- Kartenfenster ausblenden (aber so, dass Neuinstallation es wieder einblenden kann)
    -- Kommunikationsfenster ausblenden

end