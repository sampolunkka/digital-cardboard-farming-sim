/// @description Insert description here
// You can write your code in this editor
if (global.debugEnabled) {
	image_alpha = 0.5;
	draw_self();
	draw_text(text_x, text_y - 13, text_fade_alpha);
}
draw_set_alpha(text_fade_alpha);
draw_set_font(fnt_title);
draw_text_shadow(text_x, text_y, text);

draw_set_color(c_black);
draw_set_alpha(screen_fade_alpha);
draw_rectangle(0, 0, room_width, room_height, false);

draw_reset();