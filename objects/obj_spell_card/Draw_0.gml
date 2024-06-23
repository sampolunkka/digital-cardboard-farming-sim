/// @description Insert description here
// You can write your code in this editor
if (face == CardFace.Up) {
	// Draw card sprite
	sprite_index = face_up_sprite;
	draw_self();
	
	draw_set_font(global.labelFont);

	// Draw cost	
	draw_text_color(x + 3, y + 1, cost, c_white, c_white, c_yellow, c_white, 1);
	
	// Draw effect
	draw_text(x, y + sprite_height - 2 - string_height(actions_string), actions_string);
} else {
	sprite_index = face_down_sprite;
	draw_self();
}