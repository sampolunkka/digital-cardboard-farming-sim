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
	draw_sprite(spr_card_stats_underlay, on_board ? 1 : 0, x, y);
	draw_set_font(global.labelFont);
	
	// Card effect will cause stats to shift north
	var stats_offset_y = 7;
	
	// Draw cost
	if (!on_board) {
		draw_mana(x + 1, y + 8, string(cost));
	}

	// Draw stats
	draw_attack(x + 1, y + sprite_height - 17, string(attack));
	draw_hp(x + 1, y + sprite_height - 9, string(hp));
	
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