/// @description Insert description here
// You can write your code in this editor

var dy = y - yOffset;
var textX = x + 4;

if (shine) {
	draw_set_color(c_white);
	draw_set_alpha(shineAlpha);
	draw_rectangle(x-1, y-1, x + sprite_width , y + sprite_height, false);
}
draw_set_alpha(1);


draw_sprite(sprite_index, 0, x, dy);

draw_sprite(portrait, 0, x+2, dy+10);

draw_set_font(global.labelFont);

draw_set_color(c_black);
draw_text(textX,dy+4,label);
draw_set_color(c_white);
draw_text(textX,dy+3,label);

draw_set_color(c_black);
draw_text(x+5, dy+sprite_height-8, effectText);
draw_set_color(c_white);
draw_text(x+5, dy+sprite_height-9, effectText);