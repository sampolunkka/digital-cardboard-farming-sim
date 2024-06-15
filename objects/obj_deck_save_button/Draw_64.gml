/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(global.labelFont);
var text_x = x + sprite_width/2 - string_width(text)/2;
var text_y = y + sprite_height/2 - string_height(text)/2;
draw_text_color(text_x, text_y, text, c_black, c_gray, c_purple, c_black, 1);

draw_reset();