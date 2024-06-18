/// @description Insert description here
// You can write your code in this editor
//draw_self();
var stats_offset_x = 9;
if (on_board) {
	sprite_index = on_board_sprite;
	stats_offset_x = 2;
	if (fade_in_alpha < 1) {
		fade_in_alpha+=0.06;
	}
	image_alpha = fade_in_alpha;
}

draw_self();

if (face == CardFace.Up) {
	
	// Card effect will cause stats to shift north
	var stats_offset_y = has_actions() ? -1 : 7;
	
	// Draw cost
	if (!on_board) {
		draw_text_color(x + 3, y + 1, cost, c_white, c_white, c_yellow, c_white, 1);
	}
	
	// Draw stats
	draw_text_shadow(x + stats_offset_x, y + sprite_height - 25 + stats_offset_y, "@" + string(attack));
	draw_text_shadow(x + stats_offset_x, y + sprite_height - 16 + stats_offset_y, "#" + string(hp));

	// Draw effect
	if (has_actions()) {
		draw_text(x + stats_offset_x, y + sprite_height - 9, actions_string);
	}
}
draw_reset();