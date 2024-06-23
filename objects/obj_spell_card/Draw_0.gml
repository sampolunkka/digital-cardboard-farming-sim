/// @description Insert description here
// You can write your code in this editor
if (face == CardFace.Up) {
	var effect_offset_x = 6;
	var effect_offset_y = sprite_height - 9;
	// Draw card sprite
	sprite_index = face_up_sprite;
	draw_self();
	
	draw_set_font(global.labelFont);

	// Draw cost	
	draw_text_color(x + 3, y + 1, cost, c_white, c_white, c_yellow, c_white, 1);
	
	// Draw effect
	draw_sprite_stretched(
		spr_card_digit_background,
		0,
		x + effect_offset_x,
		y + effect_offset_y,
		string_width(actions_string) + 1,
		sprite_get_height(spr_card_digit_background)
	);	
	draw_text(x + effect_offset_x, y + effect_offset_y, actions_string);
} else {
	sprite_index = face_down_sprite;
	draw_self();
}