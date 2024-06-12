/// @description Insert description here
// You can write your code in this editor
if (global.debugEnabled) {
	image_alpha = 0.5;
	draw_self();
	draw_text(text_x, text_y - 13, fade_alpha);
}
draw_set_alpha(fade_alpha);
draw_set_font(fnt_title);
draw_text_shadow(text_x, text_y, text);


draw_reset();