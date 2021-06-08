
function doSpeedWalk()
    command = ""
    local save_mode = mapper.mode
    mapper.mode = "fix"
    send("ultrakurz", false)
    for i,d in ipairs(speedWalkDir) do
        if isSpecialIntExit(d)
        then
          send(d, false)
        else	
        	send(exitInt2Loc(d), false)
		end
    end
    command = ""
    send("lang", false)
    send("schau", false)
    mapper.mode = save_mode
end
                
            