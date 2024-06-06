/// @description Insert description here
// You can write your code in this editor

draw_self();
draw_set_font(global.labelFont);
draw_set_color(c_black);
draw_set_alpha(0.8);
draw_text(x+3, y+3, string_upper(label));
draw_set_alpha(1);
draw_set_color(c_white);
draw_text(x+2, y+2, string_upper(label));