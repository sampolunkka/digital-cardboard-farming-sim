/// @description Insert description here
// You can write your code in this editor
event_inherited();
if (face == CardFace.Up) {
	draw_set_font(global.labelFont);
	var effect_offset_x = 10;
	var effect_offset_y = sprite_height - string_height(actions_string) - 1;
	// Draw card sprite
	sprite_index = face_up_sprite;
	draw_self();

	// Draw cost	
	draw_text_color(x + 3, y + 1, cost, c_white, c_white, c_yellow, c_white, 1);
	
	// Draw effect
	draw_set_alpha(0.66);
	draw_sprite_stretched(
		spr_card_digit_background,
		0,
		x + effect_offset_x -1,
		y + effect_offset_y,
		string_width(actions_string) + 1,
		string_height(actions_string) + 1
	);
	draw_set_alpha(1);
	draw_text(x + effect_offset_x, y + effect_offset_y, actions_string);
} else {
	sprite_index = face_down_sprite;
	draw_self();
}