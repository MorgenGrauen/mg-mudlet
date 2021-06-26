local site = matches[1]
selectString(site, 1)
if string.starts(string.lower(site),"www") then
  site = "http://" .. string.lower(site)
end
setUnderline(true)

local command = string.format( [[openWebPage("%s")]], site )
setLink(command, f"Link {site} im Browser öffnen.")
resetFormat()