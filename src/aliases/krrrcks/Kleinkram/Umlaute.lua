-- echo("<UMLAUTE herausgenommen> <"..command..">\n");
command = string.gsub(command, 'ü', 'ue' );
command = string.gsub(command, 'ö', 'oe' );
command = string.gsub(command, 'ä', 'ae' );
command = string.gsub(command, 'Ä', 'Ae' );
command = string.gsub(command, 'Ö', 'Oe' );
command = string.gsub(command, 'Ü', 'Ue' );
command = string.gsub(command, 'ß', 'ss' );

send(command);
