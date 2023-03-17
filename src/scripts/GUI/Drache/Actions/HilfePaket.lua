function HilfePaket()

  faerbeText("script", [[
MORGENGRAUEN PAKET FÜR MUDLET
-----------------------------

Folgende Sachen gibt es und funktionieren:

* Umlaute werden erkannt und durch passende Umschreibungen ersetzt.

* Einstellungen und auch Globale Variablen
In "Scripts->Einstellungen" habe ich einige globale Variablen und
einstellbare Sachen hinterlegt:

ME: ME ist ein Table, in dem ich alle möglichen Informationen zum User speichere;
  hier landen bspw. der Name, aber auch in welcher Para-Welt man sich befindet etc.
  Soweit möglich werden die entsprechenden Werte bspw. aus GMCP-Nachrichten gezogen.
farben: In diesem Table verwalte ich die für die Trigger und Skripte zu verwendenden
  Farben.

* Farbtrigger
In Trigger befinden sich Farbtrigger, welche die Ebenen einfärben.

* Wegeskripte von tf
Ich hatte einige Wegeskripte bei tf, die insbesondere mit einem "/dopath"
zusammenarbeiteten. Ich habe diese nahezu 1:1 rekonstruiert, sie sind in den Skripten
und den Aliasen zu finden.

* Kleinkram
#haus<name> : Wenn man vor einem Seherhaus steht, kann man es damit
  aufschließen, betreten und wieder verschließen. Achtung: Kein Leerzeichen
  zwischen "#haus" und dem Namen!
]])

end
