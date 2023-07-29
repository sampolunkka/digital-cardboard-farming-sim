/// @description Insert description here
// You can write your code in this editor
if (hasHighlightedCard() && !hasDraggedCard()) {
	
	var card = highlightedCard;
	var formattedText = "";
	var tx1;
	var ty1;
	var tx2;
	var ty2;
	var maxWidth = 60;
	
	// TODO: Optimize to only format drawn text if card is new. Otherwise use prev text.
	
	// split at word
	var words = string_split(card.info, " ");
	var lines = array_create(array_length(words), "");
	var j = 0;
	
	// split lines
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
	
	// remove empty array entries from the end
	array_resize(lines, j+1);
	
	// collect formatted text
	for (var i=0; i < array_length(lines); i++) {
		formattedText += "\n" + lines[i];
		formattedText = string_trim_start(formattedText);
	}
	
	// draw box
	tx1 = card.x;
	tx2 = card.x + string_width(formattedText);
	ty1 = card.y - 4 - string_height(formattedText);
	ty2 = card.y - 4;
	
	// prevent out of screen box
	if (ty1 < 0) {
		ty1 += 2 * card.sprite_height;
		ty2 += 2 * card.sprite_height;
	}
	
	draw_set_color(c_black);
	draw_rectangle(tx1, ty1, tx2, ty2, false);
	
	// draw text
	draw_set_color(c_white);
	draw_text(tx1, ty1, formattedText);
}