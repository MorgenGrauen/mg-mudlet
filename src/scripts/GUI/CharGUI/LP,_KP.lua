function initGauges()
  GUI.GaugeLPHeight = ME.report_kp and 16 or 36
  GUI.GaugeKPHeight = ME.report_kp and 16 or 0
  GUI.GaugeYStart = 20

  initLP()
  initVorsicht()
  initKP()
  
  oldGauges()
end

function updateGauges()
  updateLP()
  updateVorsicht()
  updateKP()
end

function initLP()
  GUI.GaugeLP = Geyser.Gauge:new({
    name = "GaugeLP",
    x = 74, y = GUI.GaugeYStart,
    width = 150, height = GUI.GaugeLPHeight
  }, GUI.CharFrame)
  GUI.GaugeLP:enableClickthrough()
  registerAnonymousEventHandler("gmcp.MG.char.vitals", updateLP, false)
  registerAnonymousEventHandler("gmcp.MG.char.maxvitals", updateLP, false)
end

function initVorsicht()

end

function initKP()

end

function updateLP()
  ME.lp = gmcp.MG.char.vitals.hp
  ME.lp_max = gmcp.MG.char.maxvitals.max_hp
  local myLPQuota = ME.lp / ME.lp_max
  local myLPText = ME.lp .. "/" .. ME.lp_max .. " (" .. string.format("%.0f", 100 * myLPQuota) .. "%)"
  myLPText = "<b><center>" .. myLPText .. "</center></b> "
  GUI.GaugeLP:setValue(ME.lp, ME.lp_max, myLPText)

  local GaugeStyleSheet = [[
    --border-top: 1px black solid;
    --border-left: 1px black solid;
    --border-bottom: 1px black solid;
    --border-radius: 5;
    padding: 3px;
  ]]
--  GaugeLP.front:setStyleSheet(GaugeStyleSheet)
--  GaugeLP.back:setStyleSheet(GaugeStyleSheet)
  GUI.GaugeLP:setColor(255 * (1 - myLPQuota), 255 * myLPQuota, 50)
end

function updateVorsicht()

end

function updateKP()

end


function oldGauges()
  local imgPath = getMudletHomeDir() .. "/MorgenGrauen/CharGUI/"
  local Vo1Path = imgPath .. "/Vo1.png" 
  local Vo2Path = imgPath .. "/Vo2.png"
  
  GUI.GaugeLPVorsicht = Geyser.Container:new({
    name = "GaugeLPVorsicht",
    x = 74 - 7, y = GUI.GaugeYStart - 2, 
    width = 150, height = GUI.GaugeLPHeight
  }, GUI.CharFrame)
  
  local VorsichtX = string.format("%.0f", 100 * (ME.vorsicht / ME.lp_max)) .. "%"
  GUI.GaugeLPVorsichtOben = Geyser.Label:new({
    name = "GaugeLPVorsichtOben",
    x = VorsichtX, y = 0,
    width = 15, height = 7
  }, GUI.GaugeLPVorsicht)
  GUI.GaugeLPVorsichtOben:setStyleSheet(f[[
    background-color: rgba(0,0,0,0%);
  ]])
  GUI.GaugeLPVorsichtOben:setBackgroundImage(Vo1Path)
  GUI.GaugeLPVorsichtOben:enableClickthrough()
  
  local VorsichtY = GUI.GaugeLPHeight - 3
  GUI.GaugeLPVorsichtUnten = Geyser.Label:new({
    name = "GaugeLPVorsichtUnten",
    x = VorsichtX, y = VorsichtY,
    width = 15, height = 7
  }, GUI.GaugeLPVorsicht)
  GUI.GaugeLPVorsichtUnten:setStyleSheet(f[[
    background-color: rgba(0,0,0,0%);
  ]])
  GUI.GaugeLPVorsichtUnten:setBackgroundImage(Vo2Path)
  GUI.GaugeLPVorsichtUnten:enableClickthrough()
  GUI.GaugeLP.text:raise()
  
  
  if ME.report_kp then
    GUI.GaugeKP = Geyser.Gauge:new({
      name = "GaugeKP",
      x = 74, y = GUI.GaugeYStart + 4 + GUI.GaugeLPHeight,
      width = 150, height = GUI.GaugeKPHeight
    }, GUI.CharFrame)
    GUI.GaugeKP:setColor(0, 50, 250)
    local myKPQuota = ME.kp / ME.kp_max
    local myKPText = ME.kp .. "/" .. ME.kp_max .. " (" .. string.format("%.0f", 100 * myKPQuota) .. "%)"
    myKPText = "<b><center>" .. myKPText .. "</center></b>"
    GUI.GaugeKP:setValue(ME.kp, ME.kp_max, myKPText)
    GUI.GaugeKP:enableClickthrough()
  else
    if GUI.GaugeKP then GUI.GaugeKP:hide() end
  end
end