/// @description Insert description here
// You can write your code in this editor
//draw_self();
event_inherited();
var stats_offset_x = 9;
if (on_board) {
	sprite_index = on_board_sprite;
	stats_offset_x = 2;
	if (fade_in_alpha < 1) {
		fade_in_alpha+=0.03;
		draw_sprite_ext(spr_small_card_overlay, 0, x, y, 1, 1, 0, c_white, 1 - fade_in_alpha);
	}
	image_alpha = fade_in_alpha;
}

if (face == CardFace.Up) {
	if (on_board) {
		sprite_index = on_board_sprite;
	} else {
		sprite_index = face_up_sprite;
	}
	
	draw_self();
	
	draw_set_font(global.labelFont);
	
	// Card effect will cause stats to shift north
	var stats_offset_y = 7;
	
	// Draw cost
	if (!on_board) {
		draw_text_color(x + 3, y + 1, cost, c_white, c_white, c_yellow, c_white, 1);
	}
	
	// Draw stats
	draw_attack(x + 2, y + sprite_height - 8, string(attack));
	draw_hp(x + 7 + string_width(attack), y + sprite_height - 8, string(hp));
	
	// Draw effect
	draw_effect(x + stats_offset_x, y + sprite_height - 25);
	
	if (fatigued) {
		draw_sprite(spr_fatigue_symbol, 0, x + sprite_width, y);
	}
} else {
	sprite_index = face_down_sprite;
	draw_self();
}
draw_reset();