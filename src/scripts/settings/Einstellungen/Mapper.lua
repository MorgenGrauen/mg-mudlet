
-------------------------------------------------------
-- Benutzerdefinierte Einstellungen fuer den Mapper. --
-------------------------------------------------------

mapperconf = mapperconf or {}

-- Standardabstand zwischen zwei Raeumen
mapperconf.scale = mapperconf.scale or 2

-- Standardfarben neuer Raeume je nach Region - Mudlet bietet dazu Environments an
mapperconf.region_env = mapperconf.region_env or {
    Dschungel = 262, -- #008080 
    Ebene     = 266, -- #00ff00 
    Fernwest  = 257, -- #800000 
    Gebirge   = 272, -- #808080 
    Inseln    = 268, -- #0000ff 
    Polar     = 269, -- #00ffff 
    unbekannt = 271, -- #ffffff 
    Unterwelt = 264, -- #000000 
    Vland     = 267, -- #ffff00 
    Wald      = 258, -- #008000 
    Wueste    = 259, -- #808000 
}