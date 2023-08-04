/// @description Insert description here
// You can write your code in this editor
draw_set_font(global.CardTitleFont);
showPlaceholder = false;

for (var i = 0; i < array_length(cards); i++) {
	if (!cards[i].isPlaceholder() || showPlaceholder) {
		var idString = string_replace(cards[i].id, "ref ", "");
		draw_text(cards[i].x+3, cards[i].y+2, title);
		draw_text(cards[i].x+3, cards[i].y+8, idString);
		draw_text(cards[i].x+3, cards[i].y+14, i);
		draw_text(cards[i].x+3, cards[i].y+20, cards[i].cardtitle);
	}
}