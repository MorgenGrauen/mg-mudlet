local newmodus = ""

if ME.modus == "lang" then
  newmodus = "kurz"
elseif ME.modus == "kurz" then
  newmodus = "ultrakurz"
elseif ME.modus == "ultrakurz" then
  newmodus = "lang"
else
  newmodus = "kurz"
end

ME.modus = newmodus
send(newmodus)
