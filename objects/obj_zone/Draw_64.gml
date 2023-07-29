/// @description Insert description here
// You can write your code in this editor
draw_set_font(global.CardTitleFont);
for (var i = 0; i < array_length(cards); i++) {
	var idString = string_replace(cards[i].id, "ref ", "");
	draw_text(cards[i].x+3, cards[i].y+2, name);
	draw_text(cards[i].x+3, cards[i].y+8, idString);
}