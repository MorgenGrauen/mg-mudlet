function echoM(str)
    -- TODO: Mit faerbeText() harmonisieren..!
    fg(mapperconf.color)
    echo("[MAPPER] " .. str .. "\n")
    resetFormat()
end
