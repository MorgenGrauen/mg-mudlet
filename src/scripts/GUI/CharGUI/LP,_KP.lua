function initGauges()
  GUI.Char.GaugeLPHeight = ME.report_kp and 16 or 36
  GUI.Char.GaugeKPHeight = ME.report_kp and 16 or 0
  GUI.Char.GaugeYStart = 20

  initLP()
  initVorsicht()
  registerAnonymousEventHandler("gmcp.MG.char.vitals", updateLP, false)
  registerAnonymousEventHandler("gmcp.MG.char.maxvitals", updateLP, false)

  if ME.report_kp then
    initKP()
    registerAnonymousEventHandler("gmcp.MG.char.vitals", updateKP, false)
    registerAnonymousEventHandler("gmcp.MG.char.maxvitals", updateKP, false)
  end

  if ME.report_vorsicht then
    registerAnonymousEventHandler("gmcp.MG.char.wimpy", updateVorsicht, false)
  end

end

function updateGauges()
  updateLP()
  updateVorsicht()
  if ME.report_kp then
    updateKP()
  else
    if GUI.Char.GaugeKP then GUI.Char.GaugeKP:hide() end
  end
end

function initLP()
  GUI.Char.GaugeLP = Geyser.Gauge:new({
    name = "GaugeLP",
    x = 74, y = GUI.Char.GaugeYStart,
    width = 150, height = GUI.Char.GaugeLPHeight
  }, GUI.Char.Frame)
  GUI.GaugeLP:enableClickthrough()
end

function updateLP()
  ME.lp = gmcp.MG.char.vitals.hp
  ME.lp_max = gmcp.MG.char.maxvitals.max_hp
  local myLPQuota = ME.lp / ME.lp_max
  local myLPText = ME.lp .. "/" .. ME.lp_max .. " (" .. string.format("%.0f", 100 * myLPQuota) .. "%)"
  myLPText = "<b><center>" .. myLPText .. "</center></b> "
  GUI.Char.GaugeLP:setValue(ME.lp, ME.lp_max, myLPText)

  local GaugeStyleSheet = [[
    --border-top: 1px black solid;
    --border-left: 1px black solid;
    --border-bottom: 1px black solid;
    --border-radius: 5;
    padding: 3px;
  ]]
--  GaugeLP.front:setStyleSheet(GaugeStyleSheet)
--  GaugeLP.back:setStyleSheet(GaugeStyleSheet)
  GUI.Char.GaugeLP:setColor(255 * (1 - myLPQuota), 255 * myLPQuota, 50)
end

function initKP()
  GUI.Char.GaugeKP = Geyser.Gauge:new({
    name = "GaugeKP",
    x = 74, y = GUI.Char.GaugeYStart + 4 + GUI.Char.GaugeLPHeight,
    width = 150, height = GUI.Char.GaugeKPHeight
  }, GUI.Char.Frame)
  GUI.Char.GaugeKP:setColor(0, 50, 250)
  GUI.Char.GaugeKP:enableClickthrough()
end

function updateKP()
  ME.kp = gmcp.MG.char.vitals.sp
  ME.kp_max = gmcp.MG.char.maxvitals.max_sp
  local myKPQuota = ME.kp / ME.kp_max
  local myKPText = ME.kp .. "/" .. ME.kp_max .. " (" .. string.format("%.0f", 100 * myKPQuota) .. "%)"
  myKPText = "<b><center>" .. myKPText .. "</center></b>"
  GUI.Char.GaugeKP:setValue(ME.kp, ME.kp_max, myKPText)
end

function initVorsicht()
  local imgPath = getMudletHomeDir() .. "/MorgenGrauen/CharGUI/"
  local Vo1Path = imgPath .. "/Vo1.png" 
  local Vo2Path = imgPath .. "/Vo2.png"

  GUI.Char.GaugeLPVorsicht = Geyser.Container:new({
    name = "GaugeLPVorsicht",
    x = 74 - 7, y = GUI.Char.GaugeYStart - 2, 
    width = 150, height = GUI.Char.GaugeLPHeight
  }, GUI.Char.Frame)

  GUI.Char.GaugeLPVorsichtOben = Geyser.Label:new({
    name = "GaugeLPVorsichtOben",
    x = VorsichtX, y = 0,
    width = 15, height = 7
  }, GUI.Char.GaugeLPVorsicht)
  GUI.Char.GaugeLPVorsichtOben:setStyleSheet([[background-color: rgba(0, 0, 0, 0%);]])
  GUI.Char.GaugeLPVorsichtOben:setBackgroundImage(Vo1Path)
  GUI.Char.GaugeLPVorsichtOben:enableClickthrough()
  GUI.Char.GaugeLPVorsichtOben:hide()

  GUI.Char.GaugeLPVorsichtUnten = Geyser.Label:new({
    name = "GaugeLPVorsichtUnten",
    x = 0, y = 0,
    width = 15, height = 7
  }, GUI.Char.GaugeLPVorsicht)
  GUI.Char.GaugeLPVorsichtUnten:setStyleSheet([[background-color: rgba(0, 0, 0, 0%);]])
  GUI.Char.GaugeLPVorsichtUnten:setBackgroundImage(Vo2Path)
  GUI.Char.GaugeLPVorsichtUnten:enableClickthrough()
  GUI.Char.GaugeLPVorsichtUnten:hide()
end

function updateVorsicht()
  if gmcp and gmcp.MG and gmcp.MG.char and gmcp.MG.char.wimpy and gmcp.MG.char.wimpy.wimpy then
    ME.vorsicht = gmcp.MG.char.wimpy.wimpy
  
    local VorsichtX = string.format("%.0f", 100 * (ME.vorsicht / ME.lp_max)) .. "%"
    local VorsichtY = GUI.Char.GaugeLPHeight - 3
  
    GUI.Char.GaugeLPVorsichtOben:move(VorsichtX, 0)
    GUI.Char.GaugeLPVorsichtOben:show()
  
    GUI.Char.GaugeLPVorsichtUnten:move(VorsichtX, VorsichtY)
    GUI.Char.GaugeLPVorsichtUnten:show()
  
    GUI.Char.GaugeLP.text:raise()
    
  elseif GUI and GUI.Char and GUI.Char.GaugeLPVorsichtOben and GUI.Char.GaugeLPVorsichtUnten then
    GUI.Char.GaugeLPVorsichtUnten:hide()
    GUI.Char.GaugeLPVorsichtOben:hide()
  
  end
end
