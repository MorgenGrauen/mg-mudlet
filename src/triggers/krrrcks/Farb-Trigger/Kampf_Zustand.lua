local zustand = {}
 
zustand["ist absolut fit."] = 1
zustand["ist leicht geschwaecht."] = 0.9 -- Kaempfer Fokus
zustand["ist schon etwas geschwaecht."] = 0.9 -- untersuche
zustand["fuehlte sich auch schon besser."] = 0.8 -- Kaempfer Fokus
zustand["fuehlte sich heute schon besser."] = 0.8 -- untersuche
zustand["ist leicht angekratzt."] = 0.7 -- Kaempfer Fokus
zustand["ist leicht angeschlagen."] = 0.7 -- untersuche
zustand["ist nicht mehr taufrisch."] = 0.6 -- Kaempfer Fokus
zustand["sieht nicht mehr taufrisch aus."] = 0.6 -- untersuche
zustand["sieht recht mitgenommen aus."] = 0.5 -- Kaempfer Fokus
zustand["macht einen mitgenommenen Eindruck."] = 0.5 -- untersuche
zustand["wankt bereits bedenklich."] = 0.4
zustand["ist in keiner guten Verfassung."] = 0.3
zustand["braucht dringend einen Arzt."] = 0.2
zustand["steht auf der Schwelle des Todes."]= 0.1


local ausgabe = zustand[matches[1]]

if ausgabe then 
  ausgabe = " (" .. ausgabe*100 .. "%)" 
else
  ausgabe = " (???%)"
end

selectCurrentLine()
fg(farben.vg.info)
bg(farben.hg.info)
echo(ausgabe)
resetFormat()
