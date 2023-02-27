function initCharGUI()
  GUI = GUI or {}
  GUI.Char = GUI.Char or {}

  getGMCPdata()
  initCharFrame()

  initName()
  updateName()

  initGauges()
  updateGauges()

  initFlucht()
  updateFlucht()

  initAvatar()
  updateAvatar()
  
  initStufe()
  showStufe()

  -- oldAttribs -- tbd "Attribute"
end

function getGMCPdata()
  ME.report_attribs = false -- tbd "Attribute"

  ME.name = gmcp.MG.char.base.name
  ME.stufe = gmcp.MG.char.info.level
  ME.gilde = gmcp.MG.char.base.guild

  ME.lp = gmcp.MG.char.vitals.hp
  ME.lp_max = gmcp.MG.char.maxvitals.max_hp

  ME.gift = gmcp.MG.char.vitals.poison or 0 -- wird ggf. nicht berichtet

  ME.report_kp = gmcp.MG.char.vitals.sp and true or false
  if ME.report_kp then
    ME.kp = gmcp.MG.char.vitals.sp
    ME.kp_max = gmcp.MG.char.maxvitals.max_sp
  end

  ME.report_vorsicht = gmcp.MG.char.wimpy and true or false
  if ME.report_vorsicht then
    ME.vorsicht = gmcp.MG.char.wimpy.wimpy
    ME.fluchtrichtung = gmcp.MG.char.wimpy.wimpy_dir -- kann 0 (nicht "0") sein
  end
end