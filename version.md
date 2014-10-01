Autoren
=======

* Zesstra@MorgenGrauen - https://github.com/zesstra/mgm-scripts
* Lev@MorgenGrauen - https://github.com/krrrcks/krrrcks-mudlet
* Zaphob@MorgenGrauen - https://github.com/kebap/krrrcks-mudlet


Zesstra
-------

* Gesammelte Morgengrauen-Mudlet-Scripte
* grafische Balken für aktuelle LP und KP Anzeige
* Versuche mit gmod.registerUser und gmod.enableModule


Lev
---

* Von Zesstra habe ich Ihre MGM-Scripts hinzu genommen. Die bedürfen aber noch 
  einige Überarbeitung und fliegen anschließend denke ich auch wieder heraus. 
  Balken an eine andere Stelle gepackt.

* Außerdem habe ich von Godwars2.org (port 3000) deren Funktionen übernommen, 
  um mein Resize der Fenster die Sachen wieder anzeigen zu lassen.

* Ich habe das "run-lua-code-v4" hinzugenommen, damit kann man auf der Kommando-
  zeile mit "lua blubb" direkt den Lua-Befehl blubb ausführen.

* Die Statuszeile wird noch etwas grumpelig aufgebaut, das muss ich noch etwas
  hübscher machen. (Ich habe alle Elemente mit createGauge hinzugefügt, das ergibt
  aber nicht bei allen Elementen wirklich Sinn, muss noch entsprechend geändert werden.)

* Einige Einstellungen für Umlaute aus dem Mudlet Forum uebernommen.

* Infrastruktur für Wegeskripte

* Einige Einfärbungen für Kommunikation, Alarm/Infos, usw.


Zaphob
------

* Ich habe Levs Code weiter voran getrieben. Ziel: Bereitstellung an Spieler.

* LP Anzeige blinkt bei Treffer
* Para Erkennung & Anzeige verbessert
* Ausgänge erkennen & einfärben

* GUI auf Geyser Elemente umgestellt
* Mehrzeilige Statuszeile
* Dabei entfiel die sehr ausgefeilte automatische Erstellung der GUI Elemente. 
  (Mein Lua ist noch nicht gut genug, um das so flexibel zu machen. Derzeit 
  Hauptfokus darauf, die Skripte aus Alpha-Status herauszuholen. Refakturierung 
  kann wieder später folgen.) 

* "run-lua-code" entfernt, da es neuerdings zum Mudlet-Standard gehört.
* Fenster-Resize entfernt, bringt keinen Unterschied, hab ich nicht verstanden.

