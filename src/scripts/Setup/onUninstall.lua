function onUninstall(_, packageName)
    -- alles was direkt vor der Deinstallation des MG Pakets ausgeführt werden soll
    if not packageName == "@PKGNAME@" then return end

    setBorders(0)

end