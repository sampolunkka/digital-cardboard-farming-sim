/// @description Insert description here
// You can write your code in this editor
card = noone;
formattedText = "";
maxWidth = 60;
lifetime = 2;
timer = 0;
fixed = false;
	
function formatText() {
	var infoString = card.get_info();
	
	// Split at word
	var words = string_split(infoString, " ");
	var lines = array_create(array_length(words), "");
	var j = 0;
	
	// Split lines
	for (var i = 0; i < array_length(words); i++) {
		var lineWidth = string_width(lines[j] + " " + words[i]);	
		if (lineWidth < maxWidth) {
			lines[j] += " " + string(words[i]);
			//show_message("Same line: " + lines[j]);
		} else {
			j++;
			lines[j] += string(words[i]);
			//show_message("New line: " + lines[j]);
		}
	}
	
	// Remove empty array entries from the end
	array_resize(lines, j+1);
	
	// Collect formatted text
	for (var i=0; i < array_length(lines); i++) {
		formattedText += "\n" + lines[i];
		formattedText = string_trim_start(formattedText);
	}
}

function init(card) {
	timer = 0;
	self.card = card;
	formatText();
}