MorgenGrauen in Mudlet
======================

Hier finden sich Mudlet-Skripte für das MUD [MorgenGrauen](http://mg.mud.de). 

Das hier enthaltene Bündel an Skripten ist noch in Entwicklung. 

Wer Fehlerberichte, Anregungen oder Hinweise für Verbesserungen hat, nur her damit.

Viele Grüße [von den Autoren](version.md). Kontakt direkt hier, oder im Spiel, oder über die Webseite, usw.


Was schon funktioniert
----------------------

* Hilfreiche Funktionen
   * Mapper malt automatisch Karten
   * Bewegung mittels Nummerntasten am Keypad
   * Unterstützung für Wegeskripte, wie aus TinyFugue bekannt ("go" & "dopath")
   * Umlaute werden bei Eingabe erkannt & beim Versand durch Äquivalente ersetzt

* Farbige Hervorhebungen  
   * Kommunikation wie Ebenen, Mitteilungen, Team, uvm.
   * Infos zur Bewegung wie z.B. sichtbare Ausgänge, Fluchtmeldung.
 
* Statusleiste zeigt allgemeine Infos des Spielers
   * Lebenspunkte & Konzentration
   * Vorsicht, ggf. Fluchtrichtung
   * ggf. Vergiftungen
   * (Manche Teile des "reports" haben Voraussetzungen, die im Spiel erfüllt werden müssen)

* Statusleiste zeigt allgemeine Infos zum Raum, in dem sich der Spieler aktuell befindet:
   * Wie wird der Raum kurz genannt? 
   * Zu welcher Region gehört er? 
   * Ist man in einer Parallelwelt? (Dazu muss man an einer Kugel an
     einem Seherportal vorbeilaufen.)


Was noch offen ist
------------------

* Kampfscroll reduzieren
* Skripte für einzelne Gilden
* Detailiertere Bedienungsanleitung 


Kurzanleitung
-------------

* Ggf. natürlich erstmal [Mudlet installieren](http://www.mudlet.org/download)
   * Neues Mudlet Profil erstellen für _mg.mud.de_ Port _23_ 
   * (Weitere Charaktere benötigen eigene Profile)
* Folgende 3 Dateien herunterladen (Rechte Maustaste, Speichern unter ...)
  * [Grundskript](https://raw.githubusercontent.com/MorgenGrauen/mg-mudlet/master/krrrcks.xml) - ohne geht es nicht
  * [Einstellungen](https://raw.githubusercontent.com/MorgenGrauen/mg-mudlet/master/settings.xml) - benutzerdefinierte Einstellungen - ausgelagert aber benötigt
  * [Mapper](https://raw.githubusercontent.com/MorgenGrauen/mg-mudlet/master/mapper.xml) - optionale Erweiterung, Anleitung mit "mhilfe"
* Skripte einfügen per Drag & Drop
   * Die 3 o.g. Dateien nehmen und auf das Mudlet-Fenster fallen lassen.
   * (Kontrolle möglich über _Menu_ - _Package Manager_ - hier sollten nun die 3 Namen als letztes erscheinen)
   * (Drag & Drop funktioniert seit Mudlet 4.8 also Mitte 2020)
   * (Alternativ im Paketmanager auf Importieren klicken und zuvor gespeicherte Dateien angeben)
* Fertig, Skripte können nun benutzt werden.
   * Ggf. einmal neu verbinden, damit alles richtig lädt.
   * Auf Wunsch Skripte wieder entfernen:  Im Paket-Manager den Eintrag "MorgenGrauen" wählen & _Uninstall_ klicken
   * Schon kann es wieder von vorne losgehen! :)
