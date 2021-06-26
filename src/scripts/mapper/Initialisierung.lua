
-- Entfernt Mudlets "generic mapper" Paket, das uns stört
uninstallPackage("generic_mapper")

mudlet = mudlet or {}
mudlet.mapper_script = true

mapper = mapper or {}

mapper.mode = mapper.mode or "fix"
mapper.currentHash = mapper.currentHash or nil
mapper.currentArea = mapper.currentArea or "world"

function echoM(str)
    fg(mapperconf.color)
    echo("[MAPPER] " .. str .. "\n")
    resetFormat()
end