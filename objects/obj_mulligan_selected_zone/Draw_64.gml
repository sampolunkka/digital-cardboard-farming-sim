/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

for (var i = 0; i < getSize(); i++) {
	draw_set_alpha(1);
	draw_sprite(spr_card_highlight, 0, cards[i].x, cards[i].y);
	
	draw_set_alpha(0.5);
	draw_sprite(spr_card_highlight, 1, cards[i].x, cards[i].y);
}

draw_reset();