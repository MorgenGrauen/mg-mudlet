function initCharGUI()
  GUI = GUI or {}
  GUI.Char = GUI.Char or {}

  getGMCPdata()
  initCharFrame()
  if not table.is_field(gmcp, "MG.char") then
      -- anscheinend noch nicht eingeloggt, dann können wir noch nix anzeigen!
      registerAnonymousEventHandler("gmcp.MG.char", function()
          tempTimer(1, initCharGUI)
      end, true)
      return
  end

  initName()
  initGauges()
  initFlucht()
  initAvatar()
  initStufe()

  -- oldAttribs() -- tbd "Attribute"
end

function getGMCPdata()
  ME = ME or {}
  ME.para = ME.para or 0
  ME.lp_alt = ME.lp_alt or 100  -- Soll LP blinken bei Hit?
  ME.report_attribs = false -- tbd "Attribute"

  if not table.is_field(gmcp, "MG.char") then return end

  ME.name = gmcp.MG.char.base.name or "Jemand"
  ME.stufe = gmcp.MG.char.info.level or 0
  ME.gilde = gmcp.MG.char.base.guild

  ME.lp = gmcp.MG.char.vitals.hp or 100
  ME.lp_max = gmcp.MG.char.maxvitals.max_hp or 100

  ME.gift = gmcp.MG.char.vitals.poison or 0 -- wird ggf. nicht berichtet

  ME.report_kp = gmcp.MG.char.vitals.sp and true or false
  if ME.report_kp then
    ME.kp = gmcp.MG.char.vitals.sp or 50
    ME.kp_max = gmcp.MG.char.maxvitals.max_sp or 50
  end

  ME.report_vorsicht = gmcp.MG.char.wimpy and true or false
  if ME.report_vorsicht then
    ME.vorsicht = gmcp.MG.char.wimpy.wimpy or 0
    ME.fluchtrichtung = gmcp.MG.char.wimpy.wimpy_dir or "" -- kann 0 (nicht "0") sein
  end
end

