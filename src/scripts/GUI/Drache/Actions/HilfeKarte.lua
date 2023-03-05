function HilfeKarte()

  faerbeText("script", [[
    MORGENGRAUEN MAPPER SCHNELLEINSTIEG
    -----------------------------------

  0. Konfiguration

      Das Skript "Konfiguration" kann vom Benutzer angepasst werden. Hier werden
      Dinge eingestellt wie z.B. die Farbe der Meldungen des Mappers.

  1. Karte initialisieren

      Mit dem Befehl 'minit' wird eine frische neue Karte erstellt. Muss vor der
      ersten Benutzung des Mappers einmalig ausgefuehrt werden.

      Achtung! Dieser Befehl loescht ohne Nachfrage oder Reue die komplette Karte!

  2. Mapper Modi

      Momentan beherrscht der Mapper zwei Arbeitsmodi: fix und auto.

      - fix:  Der Standardmodus. Die Map wird nicht veraendert. Falls der aktuelle
              Raum bekannt ist, wird die Position im Map-Fenster angezeigt.

      - auto: Auto-Mapping-Modus. Der Mapper versucht (mithilfe von GMCP-Raum-IDs)
              automatisch eine Karte aufzubauen (siehe unten).

      Mit dem Befehl 'mmode <fix|auto>' kann zwischen den Modi gewechselt werden.

  3. Der Automapper

      Der Automapper kann die vom MUD gesendeten Raum-IDs dazu verwenden,
      automatisch eine Karte aufzubauen. Dies geschieht wie folgt:

      *  Zuerst muss Automapper per 'mmode auto' aktiviert werden. Dies funktioniert
         nur, wenn die Position im MUD mit der aktuellen Position auf der Karte
         uebereinstimmt (da die Karte sonst inkonsistent wuerde).

      *  Bewegt man sich nun in den naechsten Raum, wird in der entsprechenden
         Richtung ein weiterer Raum erzeugt und eine Verbindung in diese Richtung
         erzeugt.

      *  Der Mapper kann (mithilfe von Raum-IDs) erkennen, wenn z.B. ein
         Kreisfoermiger Weg vorliegt, also wenn ein bisher unbekannter Ausgang
         in einen bekannten Raum fuehrt und wird die Verbindungen entsprechend
         Einrichten.

      *  Achtung! Die allermeisten Ausgaenge haben Rueckwege in genau der
         entgegengesetzten Richtung. Da das jedoch nicht immer der Fall ist,
         wird jede der beiden Richtungen als SEPARATE Verbindung behandelt.
         Sind z.B. Raum A und Raum B auf einer Nord-Sued-Achse in beide Richtungen
         verbunden, so existieren zwei Verbindungen. Eine von A nach B namens "s"
         und eine von B nach A namens "n".
         Diese Rueckwege werden vom Automapper nicht automatisch erstellt. Der erste
         Raumwechsel erzeugt also nur eine Verbindung in eine Richtung. Um den Rueck-
         weg auch zu verbinden, muss man zusaetzlich noch einen Schritt in die
         Gegenrichtung machen. Damit hat man dann eine Zwei-Wege-Verbindung.

      *  Da der Automapper sehr von den Raum-IDs abhaengig ist, kann er nicht mit
         Raeumen umgehen, die diese IDs nicht senden. Das ist z.B. bei vielen
         Labyrinthen der Fall, allerdings auch, wenn man z.B. blind ist oder der
         Raum zu dunkel ist (zum Mappen also immer Lichtquelle und Augenlicht
         dabeihaben ;)) Der Automapper wird sich in so einem Fall selbst deaktivieren
         und eine entsprechende Meldung ausgeben.

      *  Bei viel Lag wird man ebenfalls in Probleme beim Mappen laufen, da der
         Automapper nach jedem Schritt erst die Antwort des MUDs abwarten muss
         bevor er einen Raum / Ausgang erstellen kann. Waehrend dieser Zeit darf man
         keine weiteren Eingaben taetigen! (Also, beim Automappen einfach immer warten,
         bis die Raumbeschreibung ankommt)

  4. Areas

      Karten in einem MUD koennen 1. sehr sehr gross werden und 2. nicht immer geometrisch
      plausibel sein. Das MG ist zwar in dieser Hinsicht recht ordentlich (die meisten
      Gegenden koennen sinnvoll auf einem karierten Papier aufgetragen werden), dennoch
      ist das nicht immer der Fall. Mudlet loest dieses Problem mit sog. 'Areas'.
      Eine Area ist ein zusammenhaengender Kartenabschnitt, der als Gesamtheit angezeigt wird,
      d.h. es macht Sinn, konsistenten Kartenabschnitten eine Area zuzuweisen und an Stellen,
      an denen "Brueche" in der Map sind eine neue Area anzufangen.
      Die Map-Ansicht in Mudlet wird immer nur die Area anzeigen, in der man sich gerade
      befindet. Wechselt man die Area, aendert sich auch der angezeigte Kartenabschnitt.
      Ausgaenge die in eine neue Area fuehren, werden als Pfeile angezeigt.

      Jeder Raum hat eine zugewiesene Area. Beim Mappen muss man darauf achten, dass diese
      Zuweisungen auch sinnvoll sind. Der Automapper besitzt immer eine "aktuelle Area",
      diese kann mit 'marea <name>' gesetzt werden. Immer wenn nun ein neuer Raum erstellt
      wird (siehe oben), wird diesem Raum die aktuelle Area zugewiesen.

      Betritt man einen bekannten Raum, so wird die aktuelle Area auf die Area des Raumes
      gesetzt. D.h. beim Automappen muss man nur darauf achten, 'marea <name>' auszufuehren,
      wenn man eine neue Area anfangen will. Macht man das nicht, so wird immer die aktuelle
      Area mit neuen Raeumen erweitert.
  ]])

end
