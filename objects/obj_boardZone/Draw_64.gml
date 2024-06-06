/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (debug_show_zone_card_info()) {
	for (var i = 0; i < array_length(cards); i++) {
		if (!instance_exists(cards[i])) return;
		draw_text(x, y + 6*i,string(i) + ": " + mask_instance_ref(cards[i]) + " " + string(cards[i].label));
	}
}