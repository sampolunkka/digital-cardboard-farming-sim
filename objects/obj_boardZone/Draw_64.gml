/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (debug_show_zone_card_info()) {
	for (var i = 0; i < array_length(cards); i++) {
		draw_text(x, y + 6*i,string(i) + ": " + string(cards[i].id) + " " + string(cards[i].title));
	}
}