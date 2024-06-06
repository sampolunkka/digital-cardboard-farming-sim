/// @description Insert description here
// You can write your code in this editor
if (on_board) {
	if (fade_in_alpha < 1) {
		fade_in_alpha+=0.06;
	}
	image_alpha = fade_in_alpha;
	draw_self();
	
} else if (isFaceUp()) {
	
	draw_sprite(spr_card_base, 0, x, y);
	draw_sprite(portrait, 0, x + 5, y + 11);
	draw_sprite(spr_card_stats_overlay, 0, x, y);
	
	// Draw label
	draw_text_color(x + 3, y + 3, label, c_black, c_black, c_fuchsia, c_dkgray, 1);
	
	// Draw cost
	var cost_x = cost > 9 ? 4 : 6;
	draw_text_color(x + cost_x, y + 17, cost, c_black, c_black, c_orange, c_dkgray, 1);
	
	// Draw attack
	var atk_x = attack > 9 ? 4 : 6;
	draw_text_color(x + atk_x, y + 33, attack, c_black, c_black, c_blue, c_dkgray, 1);

	// Draw health
	var hp_x = hp > 9 ? 4 : 6;
	draw_text_color(x + hp_x, y + 41, hp, c_black, c_black, c_blue, c_dkgray, 1);
} else {
	draw_self();
}