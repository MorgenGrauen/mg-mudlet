-- Die alten tf-Wegeskripte. 

--[[ Gestartet werden diese mit "#go <ziel>", dann wird 
    Ziel ausgewählt und die Sachen zum Mud geschossen. Dabei
    ist zu beachten, dass die meisten Skripte bei einem Portal
    bzw. beim Sandtiger starten. ]]--

-- Als Beispiel zwei Wege: Sandtiger-Hochebene und zurueck.

wege.he = { "#dopath w n n w w w n nw nw nw w nw nw nw w w no no o no o o", "folge hund" }
wege.he_st = { "folge hund", "#dopath w w sw w sw sw o o so so so o so so so s o o o s s o" }

local kommandos = wege[matches[2]]

if type(kommandos) == "table" then
  alt_ws(kommandos)
else
  echo (string.format("Weg %s ist nicht bekannt.", matches[2]))
end

