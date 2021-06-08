Entwicklung
===========

Wo?
---

* Alle Entwicklung soll in den Source-Dateien im Ordner "src" geschehen.
* Die Unterordner darin entsprechen der Ordnerstruktur, die man in Mudlet sieht.
* Dabei gibt es jeweils Unterordner für Objekte wie Trigger, Alias, Keys, Scripte, usw.
* Außerdem gibt es einen "Ressources"-Ordner für sonstige Daten (Bilder, usw.)
* Hier kann man bestehende Objekte verändern, neue hinzufügen, usw.

Wie?
----

* Jedes Objekt, das selbst Lua-Code enthält, existiert in seinem Ordner als eigene Lua-Datei.
* Daneben gibt es eine zentrale Json-Datei pro (Unter-)Ordner, das die dortigen Objekte konfiguriert.
* Zur Konfiguration zählen alle Einstellungen, die über den reinen Lua-Code hinausgehen, bspw. Patterns.
* Details zur Konfiguration gibt es in demonnics ["Muddler"](https://github.com/demonnic/muddler) Repository und Wiki.

Wann?
-----

* Wenn man bei sich einige Änderungen durchgeführt hat, möchte man sie ggf. an andere Spieler zurückgeben.
* Dazu "forkt" man sich dieses "mg-mudlet" Repository und ergänzt alle Neuerungen zB per git oder Github.
* Anschließend eröffnet man einen Pull Request und beschreibt die Änderungen, damit sie geprüft und freigegeben werden können.
* Bei jedem Commit oder PR neuer Änderungen wird ein automatischer Workflow gestartet, der das Paket zusammen baut und als gezippte Datei bereitstellt. Wenn man sich dort reinklickt, findet man es unter "Artifacts" als Download. Dies kann man wie gehabt in Mudlet importieren und somit testen, dass alles gut zusammen passt.
* Freigegebene Änderungen werden mit der nächsten offiziellen [Release](#release)-Version veröffentlicht.


Release
=======

Wie?
----

* Wenn genug neue Commits & PR eingegangen sind, wird eine offizielle Version veröffentlicht.
* Jede Veröffentlichung trägt dabei eine Versionsnummer in der Form X.Y (also 1.0 und 1.1 usw.)
* Die Nummer muss in die "mfile"-Datei im Hauptverzeichnis aktualisiert werden.
* Die Nummer wird auch mit dem neuen Release ([Wo?](#wo)) bekanntgegeben.
* Das gezippte Paket wird von ".zip" umbenannt in ".mpackage" und muss dem Release in Github als Asset beigefügt werden, damit der Link im [Readme](README.md) greift und auf den neuen Download zeigt.

Wo?
---

* Releases finden sich bei Github hier: https://github.com/MorgenGrauen/mg-mudlet/releases
* Das "neuste" Release hat dabei immer den Link: https://github.com/MorgenGrauen/mg-mudlet/releases/latest
* Im Text werden kurz die wichtigsten Änderungen seit letztem Release beschrieben
* Der Text wird an mehreren Orten wiederverwendet, zB. auch im Spiel in der MPA Rubrik Mudclients
* In Mudlet wird als Beschreibung automatisch das [Readme](README.md) von Github recyclet.
