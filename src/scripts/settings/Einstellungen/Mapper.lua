
-------------------------------------------------------
-- Benutzerdefinierte Einstellungen fuer den Mapper. --
-------------------------------------------------------

mapperconf = mapperconf or {}

-- Standardabstand zwischen zwei Raeumen
mapperconf.scale = mapperconf.scale or 2

-- Standardfarben neuer Raeume je nach Region - Mudlet bietet dazu Environments an
mapperconf.region_env = mapperconf.region_env or {
    { dschungel = 262 }, -- #008080 
    { ebene     = 266 }, -- #00ff00 
    { fernwest 	= 257 }, -- #800000 
    { gebirge 	= 272 }, -- #808080 
    { inseln    = 268 }, -- #0000ff 
    { polar     = 269 }, -- #00ffff 
    { unbekannt = 271 }, -- #ffffff 
    { unterwelt = 264 }, -- #000000 
    { vland     = 267 }, -- #ffff00 
    { wald 	    = 258 }, -- #008000 
    { wueste    = 259 }, -- #808000 
}