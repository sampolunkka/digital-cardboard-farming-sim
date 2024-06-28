/// @description Insert description here
// You can write your code in this editor
event_inherited();
if (face == CardFace.Up) {
	draw_set_font(global.labelFont);
	var effect_offset_x = 10;
	var effect_offset_y = sprite_height - 9;
	// Draw card sprite
	sprite_index = face_up_sprite;
	draw_self();

	// Draw cost	
	draw_text_color(x + 3, y + 1, cost, c_white, c_white, c_yellow, c_white, 1);
	
	// Draw effect
	draw_effect(x + effect_offset_x, y + effect_offset_y);
} else {
	sprite_index = face_down_sprite;
	draw_self();
}