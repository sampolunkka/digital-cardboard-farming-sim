/// @description Insert description here
// You can write your code in this editor
//draw_self();

if (on_board) {
	image_index = 0;
	image_speed = 0;
	if (fade_in_alpha < 1) {
		fade_in_alpha+=0.06;
	}
	image_alpha = fade_in_alpha;
}

draw_self();

if (face == CardFace.Up) {
	
	// Card effect will cause stats to shift north
	var stats_offset_y = has_actions() ? 0 : 6;
	
	// Draw cost
	draw_text_color(x + 3, y + 1, cost, c_white, c_white, c_yellow, c_white, 1);
	
	// Draw attack
	var atk_x = x + 9 + sprite_get_width(spr_sword);
	var atk_y = y + 18 + stats_offset_y;
	draw_sprite(spr_sword, 0, x + 8, atk_y);
	draw_sprite(spr_card_digit_background, 0, atk_x, atk_y);
	draw_text_color(atk_x, atk_y, attack, c_white, c_white, c_orange, c_white, 1);

	// Draw health
	var hp_x = x + 9 + sprite_get_width(spr_heart);
	var hp_y = y + 26 + stats_offset_y;
	draw_sprite(spr_heart, 0, x + 8, hp_y);
	draw_sprite(spr_card_digit_background, 0, hp_x, hp_y);
	draw_text_color(hp_x, hp_y, hp, c_white, c_white, c_fuchsia, c_white, 1);
	
	// Draw effect
}
draw_reset();