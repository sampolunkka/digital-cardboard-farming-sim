/// @description Insert description here
// You can write your code in this editor
draw_set_font(global.labelFont);
if (array_length(cards) < 1) {
	image_index = 1;
} else {
	image_index = 0;
}
draw_self();
draw_text_shadow(x + sprite_width/2 - 2, y + sprite_height - 16, deck_id + 1);