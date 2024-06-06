/// @description Insert description here
// You can write your code in this editor
draw_set_font(global.labelFont);
showPlaceholder = false;

if (debug_show_zone_card_info()) {
	for (var i = 0; i < array_length(cards); i++) {
		if (!instance_exists(cards[i])) return;
		if (!cards[i].isPlaceholder() || showPlaceholder) {
			//draw_text(cards[i].x+3, cards[i].y+2, label);
			draw_text_shadow(cards[i].x+3, cards[i].y-8, mask_instance_ref(cards[i]));
			//draw_text(cards[i].x+3, cards[i].y+14, i);
			//draw_text(cards[i].x+3, cards[i].y+20, cards[i].label);
		}
	}
}