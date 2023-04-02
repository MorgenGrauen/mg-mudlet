
-- Entfernt Mudlets "generic mapper" Paket, das uns stört
uninstallPackage("generic_mapper")

mapper = mapper or {}
mapper.mode = mapper.mode or "auto"
mapper.currentHash = mapper.currentHash or nil
mapper.currentArea = mapper.currentArea or "world"
