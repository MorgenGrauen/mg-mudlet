function initName()
  GUI.NameLabel = Geyser.Label:new({
    name = "NameLabel", fgColor = "white",
    x = 64, y = 0, padding = 0,width = 170, height = 17
    }, GUI.CharFrame)
  GUI.NameLabel:setStyleSheet([[
    border-color: rgb(113,75,50,255);
    border-width: 1px; border-style: solid; border-radius: 8px;
    background-color:rgba(200,200,160,20%);
    font: italic;
  ]])
  GUI.NameLabel:enableClickthrough()
end
 
function updateName()
  local NameString = ME.name
  NameString = f[[ {NameString} ]]

  -- Name um ggf. Giftsymbole erweitern
  local GiftSymbol = "☠️"
  local myGift = ME.gift

  if myGift == 0 then      -- keins
    NameString = f[[<font color="white">{NameString}</font>]]
  elseif myGift < 4 then  -- leicht
    NameString = f[[<font color="yellow">{GiftSymbol}{NameString}{GiftSymbol}</font>]]
  elseif myGift < 9 then  -- gefaehrlich
    NameString = f[[<font color="orange">{GiftSymbol}{GiftSymbol}{NameString}{GiftSymbol}{GiftSymbol}</font>]]
  else                    -- sehr ernst
    NameString = f[[<font color="red">{GiftSymbol}{GiftSymbol}{GiftSymbol}{NameString}{GiftSymbol}{GiftSymbol}{GiftSymbol}</font>]]
  end

  NameString = f[[<center><b>{NameString}</b></center>]]
  
GUI.NameLabel:echo(NameString)
end