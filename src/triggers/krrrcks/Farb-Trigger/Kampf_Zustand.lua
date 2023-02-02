local zustand = {}
 
zustand["ist absolut fit."] = 1 -- untersuche
zustand["ist leicht geschwaecht."] = 0.9 -- Kaempfer Fokus
zustand["ist schon ein wenig schwaecher."] = 0.9 -- Matrix
zustand["ist schon etwas geschwaecht."] = 0.9 -- untersuche
zustand["fuehlte sich auch schon besser."] = 0.8 -- Kaempfer Fokus
zustand["fuehlte sich heute auch schon besser."] = 0.8 -- Matrix
zustand["fuehlte sich heute schon besser."] = 0.8 -- untersuche
zustand["ist leicht angekratzt."] = 0.7 -- Kaempfer Fokus
zustand["sieht ein wenig angekratzt aus."] = 0.7 -- Matrix
zustand["ist leicht angeschlagen."] = 0.7 -- untersuche
zustand["ist nicht mehr taufrisch."] = 0.6 -- Kaempfer Fokus
zustand["ist deutlich angekratzt."] = 0.6 -- Matrix
zustand["sieht nicht mehr taufrisch aus."] = 0.6 -- untersuche
zustand["sieht recht mitgenommen aus."] = 0.5 -- Kaempfer Fokus
zustand["sieht recht mitgenommen aus."] = 0.5 -- Matrix
zustand["macht einen mitgenommenen Eindruck."] = 0.5 -- untersuche
zustand["schwankt und wankt."] = 0.4 -- Matrix
zustand["wankt bereits bedenklich."] = 0.4 -- untersuche
zustand["war auch schon mal deutlich besser drauf."] = 0.3 -- Matrix
zustand["ist in keiner guten Verfassung."] = 0.3 -- untersuche
zustand["braucht dringend aerztliche Behandlung."] = 0.2 -- Matrix
zustand["braucht dringend einen Arzt."] = 0.2 -- untersuche
zustand["steht auf der Schwelle des Todes."] = 0.1 -- untersuche
zustand["ist schon so gut wie bei Lars."] = 0.1 -- Matrix

local ausgabe = zustand[matches[1]]

if ausgabe then 
  ausgabe = " (" .. ausgabe*100 .. "%)" 
else
  ausgabe = " (???%)"
end

zeile_faerben("info")
text_faerben("info", ausgabe)
