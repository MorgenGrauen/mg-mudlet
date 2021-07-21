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
end

function updateFlucht()
  local FluchtString = "Vo: " .. ME.vorsicht
  if ME.report_vorsicht then
    if ME.fluchtrichtung ~= 0 then 
      FluchtString = FluchtString .. ", FR: " .. ME.fluchtrichtung 
    end
  end
  GUI.FluchtLabel:echo("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" .. FluchtString)
end
