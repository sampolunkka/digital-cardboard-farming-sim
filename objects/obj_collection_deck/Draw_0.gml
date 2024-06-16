/// @description Insert description here
// You can write your code in this editor
draw_set_font(global.labelFont);
if (array_length(cards) < 1) {
	if (collision_point(mouse_x, mouse_y, self, false, false)) {
		image_alpha = 0.5;
		draw_set_alpha(1);
	} else {
		image_alpha = 0.2;
		draw_set_alpha(0.8);
	}
	image_index = 1;
	draw_self();
	var empty_text = "Empty";
	draw_text_shadow(x + 1 + sprite_width/2 - string_width(empty_text)/2, y + sprite_height - 16, empty_text);
} else {
	
	if (collision_point(mouse_x, mouse_y, self, false, false)) {
		draw_set_alpha(0.5);
		draw_sprite(spr_deck_highlight, 0, x-1, y-1);
	}
	
	draw_set_alpha(1);
	image_alpha = 1;
	image_index = 0;
	draw_self();
	draw_text_shadow(x + sprite_width/2 - 2, y + sprite_height - 16, deck_id + 1);
}

draw_reset();