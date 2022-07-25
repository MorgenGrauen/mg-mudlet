function initFlucht()
  GUI.FluchtLabel = Geyser.Label:new({
    name = "FluchtLabel", fgColor = "white",
    x = 64, y = 56, padding = 0,width = 170, height = 17
  }, GUI.CharFrame)
  GUI.FluchtLabel:setStyleSheet([[
    border-color: rgba(0,0,0,0%);
    border-width: 0px;
    border-style: solid;
    border-radius: 8px;
    background-color: rgba(201,180,123,0%);
    font-size: 6pt;
  ]])
  GUI.FluchtLabel:enableClickthrough()
  registerAnonymousEventHandler("gmcp.MG.char.wimpy", updateFlucht, false)
end

function updateFlucht()
  local FluchtString = ""
  if gmcp and gmcp.MG and gmcp.MG.char and gmcp.MG.char.wimpy 
          and gmcp.MG.char.wimpy.wimpy and gmcp.MG.char.wimpy.wimpy_dir then
    ME.vorsicht = gmcp.MG.char.wimpy.wimpy
    ME.fluchtrichtung = gmcp.MG.char.wimpy.wimpy_dir
    if ME.report_vorsicht then
      if ME.vorsicht == 0 then
        FluchtString = "Vo: NIX"
      else
        FluchtString = "Vo: " .. ME.vorsicht
      end
      if ME.fluchtrichtung and (ME.fluchtrichtung ~= 0) then 
        FluchtString = FluchtString .. ", FR: " .. ME.fluchtrichtung 
      end
    end
  end
  GUI.FluchtLabel:echo("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" .. FluchtString)
end