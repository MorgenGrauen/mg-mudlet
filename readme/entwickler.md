Entwicklung
===========

Wo?
---

* Alle Entwicklung soll in den Source-Dateien im Ordner "src" geschehen.
* Die Unterordner darin entsprechen der Ordnerstruktur, die man in Mudlet sieht
* Dabei gibt es jeweils Unterordner für Objekte wie Trigger, Alias, Keys, Scripte, usw.
* Außerdem gibt es einen "Ressources"-Ordner für sonstige Daten (Bilder, usw.)

Wie?
----

* Jedes Objekt, das selbst Lua-Code enthält, existiert darin als eigene Lua-Datei
* Daneben gibt es eine zentrale Json-Datei pro Unterordner, das diese Objekte konfiguriert.
* Details zur Konfiguration gibt es auch in demonnics ["Muddler"](https://github.com/demonnic/muddler) Repository und Wiki

Wann?
-----

* Bei jedem Commit oder PR neuer Änderungen wird ein automatischer Workflow gestartet, der das Paket zusammen baut und als gezippte ".mpackage" Datei bereitstellt. Dies kann man wie gehabt in Mudlet importieren und somit testen, dass alles gut zusammen passt.
* Die Änderungen werden mit der nächsten offiziellen [Release](#release)-Version veröffentlicht


Release
=======

Wo?
---

* Im Verzeichnis "build" werden die fertigen Paket-Dateien nachgehalten (eigentlich nur noch aus historischen Gründen, könnte beizeiten mal entfallen)
* Dabei ist die ".mpackage"-Datei führend und der empfohlene Download für Spieler
* Daneben liegen die entpackten Inhalte der gezippten mpackage-Datei zum Vergleich

Wie?
----

* Wenn genug neue Commits & PR eingegangen sind, wird der build-Ordner manuell aktualisiert
* Jede Veröffentlichung trägt dabei eine Versionsnummer in der Form X.Y also 1.0 und 1.1 usw.
* Die Nummer muss in die "mfile"-Datei im Hauptverzeichnis aktualisiert werden
* Die Nummer wird auch mit dem neuen Release ([Wo?](#wo)) bekanntgegeben
* Die .mpackage Datei muss dem Release auch nochmal als Asset beigefügt werden, um im Download bereitzustehen (der zeigt aber derzeit noch auf die Datei im "build" Ordner und nicht auf den latest release asset - soll in Kürze ergänzt werden)

Wo?
---

* Kurz die Änderungen seit letztem Release beschreiben und an mehrere Orte posten:
* Als offizielle "Release" bei Github, z.B. hier: https://github.com/MorgenGrauen/mg-mudlet/releases/tag/1.1
* Im Spiel in der MPA Rubrik Mudclients

