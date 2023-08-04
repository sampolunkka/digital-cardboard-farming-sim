/// @description Insert description here
// You can write your code in this editor

var dy = y - yOffset;

draw_sprite(sprite_index, 0, x, dy);

draw_sprite(portrait, 0, x+1, dy+7);

draw_set_font(global.CardTitleFont);

draw_set_color(c_black);
draw_text(x+5,dy+4,cardtitle + string(handIndex));
draw_set_color(c_white);
draw_text(x+5,dy+3,cardtitle + string(handIndex));

draw_set_color(c_black);
draw_text(x+5, dy+sprite_height-8, "+XX")
draw_set_color(c_white);
draw_text(x+5, dy+sprite_height-9, "+XX")