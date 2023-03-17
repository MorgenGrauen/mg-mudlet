local imgPath = getMudletHomeDir() .. "/@PKGNAME@/" .. "CharGUI/emoji/"
local AvatarPaths = {
  kaempfer = "2694 Schwerter 512.png",
  abenteurer = "1F9ED Kompass 512.png",
  zauberer = "1F9D9 Zauberer 512.png",
  chaos = "1F608 Böse 512.png",
  urukhai = "1F479 Ork 512.png",
  bierschuettler = "1F37A Bier 512.png",
  katzenkrieger = "1F9F6 Knäuel 512.png",
  wipfellaeufer = "1F333 Baum 512.png",
  dunkelelfen = "1F577 Spinne 512.png",
  tanjian = "262F Yinyang 512.png",
  karate = "1F94B Karate 512.png",
  klerus = "1F607 Heilig 512.png",
  werwoelfe = "1F43A Wolf 512.png",
  glitzer = "2728 Glitzer 512.png",
}

function initAvatar()
  GUI.Char.AvatarFrame = Geyser.Container:new({
    name = "AvatarFrame",
    x = 0, y = 0, padding = 0,width = 74, height = 74,
  }, GUI.Char.Frame)
  GUI.Char.AvatarLabel = Geyser.Label:new({
    name = "AvatarLabel",
    x = 0, y = 0, width = "100%", height = "100%",
  }, GUI.Char.AvatarFrame)
  GUI.Char.AvatarLabel:setStyleSheet(f[[
    xborder-color: rgba(113, 75, 50, 100%);
    xborder-width: 1px; border-style: solid; xborder-radius: 37px;
    xbackground-color:rgba(200, 200, 160, 20%);
    qproperty-alignment: AlignCenter;
  ]])
  GUI.Char.AvatarLabel:enableClickthrough()
  registerAnonymousEventHandler("gmcp.MG.char.base", updateAvatar, false)
  if table.is_field(gmcp, "MG.char.base") then
    updateAvatar()
  end
end

function updateAvatar()
  -- Gilde gewechselt? Sollten wir anzeigen!
  -- Am besten nur neuen AvatarPath einfügen, Rest beibehalten
  -- braucht Vadis CSSMan? https://forums.mudlet.org/viewtopic.php?t=3502
  ME.gilde = gmcp.MG.char.base.guild or nil
  local AvatarPath = imgPath .. AvatarPaths[ME.gilde] or AvatarPaths["glitzer"]
  GUI.Char.AvatarLabel:setStyleSheet(f[[
    xborder-color: rgba(113, 75, 50, 100%);
    xborder-width: 1px; border-style: solid; xborder-radius: 37px;
    xbackground-color:rgba(200, 200, 160, 20%);
    qproperty-alignment: AlignCenter;
    border-image: url("{AvatarPath}");
  ]])
end
