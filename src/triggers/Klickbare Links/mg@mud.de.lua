selectString(matches[1], 1)
setUnderline(true)

local command = string.format( [[openWebPage("mailto:%s")]], matches[1] )
setLink(command, "Email ans MorgenGrauen Team senden.")
resetFormat()