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
	var stats_offset_y = has_actions() ? -1 : 7;
	
	// Draw cost
	if (!on_board) {
		draw_text_color(x + 3, y + 1, cost, c_white, c_white, c_yellow, c_white, 1);
	}
	
	// Draw digit underlay for stats
	draw_sprite_stretched(
		spr_card_digit_background,
		0,
		x + stats_offset_x + string_width("@") - 1,
		y + sprite_height - 25 + stats_offset_y,
		string_width(attack) + 1,
		sprite_get_height(spr_card_digit_background)
	);
	
	draw_sprite_stretched(
		spr_card_digit_background,
		0,
		x + stats_offset_x + string_width("#") - 1,
		y + sprite_height - 16 + stats_offset_y,
		string_width(hp) + 1,
		sprite_get_height(spr_card_digit_background)
	);	
	
	// Draw stats
	draw_text(x + stats_offset_x, y + sprite_height - 25 + stats_offset_y, "@" + string(attack));
	draw_text(x + stats_offset_x, y + sprite_height - 16 + stats_offset_y, "#" + string(hp));
	
	// Draw effect
	if (has_actions()) {
		draw_text_shadow(x + stats_offset_x, y + sprite_height - 9, actions_string);
	}
	
	if (fatigued) {
		draw_sprite(spr_fatigue_symbol, 0, x + sprite_width, y);
	}
} else {
	sprite_index = face_down_sprite;
	draw_self();
}
draw_reset();