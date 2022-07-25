function initGauges()
  GUI.GaugeLPHeight = ME.report_kp and 16 or 36
  GUI.GaugeKPHeight = ME.report_kp and 16 or 0
  GUI.GaugeYStart = 20

  initLP()
  initVorsicht()
  if ME.report_kp then
    initKP()
  end

  -- oldGauges()

  registerAnonymousEventHandler("gmcp.MG.char.vitals", updateLP, false)
  registerAnonymousEventHandler("gmcp.MG.char.maxvitals", updateLP, false)
  registerAnonymousEventHandler("gmcp.MG.char.vitals", updateKP, false)
  registerAnonymousEventHandler("gmcp.MG.char.maxvitals", updateKP, false)
  registerAnonymousEventHandler("gmcp.MG.char.wimpy", updateVorsicht, false)
end

function updateGauges()
  updateLP()
  updateVorsicht()
  if ME.report_kp then
    updateKP()
  else
    if GUI.GaugeKP then GUI.GaugeKP:hide() end
  end
end

function initLP()
  GUI.GaugeLP = Geyser.Gauge:new({
    name = "GaugeLP",
    x = 74, y = GUI.GaugeYStart,
    width = 150, height = GUI.GaugeLPHeight
  }, GUI.CharFrame)
  GUI.GaugeLP:enableClickthrough()
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

function initKP()
  GUI.GaugeKP = Geyser.Gauge:new({
    name = "GaugeKP",
    x = 74, y = GUI.GaugeYStart + 4 + GUI.GaugeLPHeight,
    width = 150, height = GUI.GaugeKPHeight
  }, GUI.CharFrame)
  GUI.GaugeKP:setColor(0, 50, 250)
  GUI.GaugeKP:enableClickthrough()
end

function updateKP()
  ME.kp = gmcp.MG.char.vitals.sp
  ME.kp_max = gmcp.MG.char.maxvitals.max_sp
  local myKPQuota = ME.kp / ME.kp_max
  local myKPText = ME.kp .. "/" .. ME.kp_max .. " (" .. string.format("%.0f", 100 * myKPQuota) .. "%)"
  myKPText = "<b><center>" .. myKPText .. "</center></b>"
  GUI.GaugeKP:setValue(ME.kp, ME.kp_max, myKPText)
end

function initVorsicht()
  local imgPath = getMudletHomeDir() .. "/MorgenGrauen/CharGUI/"
  local Vo1Path = imgPath .. "/Vo1.png" 
  local Vo2Path = imgPath .. "/Vo2.png"

  GUI.GaugeLPVorsicht = Geyser.Container:new({
    name = "GaugeLPVorsicht",
    x = 74 - 7, y = GUI.GaugeYStart - 2, 
    width = 150, height = GUI.GaugeLPHeight
  }, GUI.CharFrame)

  GUI.GaugeLPVorsichtOben = Geyser.Label:new({
    name = "GaugeLPVorsichtOben",
    x = VorsichtX, y = 0,
    width = 15, height = 7
  }, GUI.GaugeLPVorsicht)
  GUI.GaugeLPVorsichtOben:setStyleSheet([[background-color: rgba(0,0,0,0%);]])
  GUI.GaugeLPVorsichtOben:setBackgroundImage(Vo1Path)
  GUI.GaugeLPVorsichtOben:enableClickthrough()
  GUI.GaugeLPVorsichtOben:hide()

  GUI.GaugeLPVorsichtUnten = Geyser.Label:new({
    name = "GaugeLPVorsichtUnten",
    x = 0, y = 0,
    width = 15, height = 7
  }, GUI.GaugeLPVorsicht)
  GUI.GaugeLPVorsichtUnten:setStyleSheet([[background-color: rgba(0,0,0,0%);]])
  GUI.GaugeLPVorsichtUnten:setBackgroundImage(Vo2Path)
  GUI.GaugeLPVorsichtUnten:enableClickthrough()
  GUI.GaugeLPVorsichtUnten:hide()
end

function updateVorsicht()
  if gmcp and gmcp.MG and gmcp.MG.char and gmcp.MG.char.wimpy and gmcp.MG.char.wimpy.wimpy then
    ME.vorsicht = gmcp.MG.char.wimpy.wimpy
  
    local VorsichtX = string.format("%.0f", 100 * (ME.vorsicht / ME.lp_max)) .. "%"
    local VorsichtY = GUI.GaugeLPHeight - 3
  
    GUI.GaugeLPVorsichtOben:move(VorsichtX, 0)
    GUI.GaugeLPVorsichtOben:show()
  
    GUI.GaugeLPVorsichtUnten:move(VorsichtX, VorsichtY)
    GUI.GaugeLPVorsichtUnten:show()
  
    GUI.GaugeLP.text:raise()
    
  elseif GUI and GUI.GaugeLPVorsichtOben and GUI.GaugeLPVorsichtUnten then
    GUI.GaugeLPVorsichtUnten:hide()
    GUI.GaugeLPVorsichtOben:hide()
  
  end
end
