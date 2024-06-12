/// @description Insert description here
// You can write your code in this editor

var heart_width = sprite_get_width(spr_heart);
var heart_height = sprite_get_height(spr_heart);
var bar_y = y - sprite_height;


if (fade_in_alpha < 1) {
	fade_in_alpha+=0.06;
}
draw_set_alpha(fade_in_alpha);

	var draw_x = floor(x - 2 * heart_width/2 - sprite_width/2);
	
	// Attack
	var atk_y = bar_y-8;
	draw_sprite(spr_attack_bar, 0, draw_x, atk_y);
	
	draw_sprite(spr_attack_bar, 1, draw_x + heart_width, atk_y);
	draw_sprite(spr_sword, 0, draw_x + heart_width, atk_y);
	
	draw_sprite(spr_attack_bar, 1, draw_x + heart_width * 2, atk_y);
	draw_text_color(draw_x + heart_width * 2-1, atk_y - 3, atk, c_white, c_white, c_yellow, c_orange, 1);
	draw_sprite(spr_attack_bar, 2, draw_x + heart_width * 3, atk_y);
	
	
	//Health
	draw_sprite(spr_health_bar, 0, draw_x, bar_y);
	
	draw_sprite(spr_health_bar, 1, draw_x + heart_width, bar_y);
	draw_sprite(spr_heart, 0, draw_x + heart_width, bar_y);
	
	draw_sprite(spr_health_bar, 1, draw_x + heart_width * 2, bar_y);
	draw_text_color(draw_x + heart_width * 2-1, bar_y - 3, hp, c_white, c_white, c_fuchsia, c_purple, 1);
	
	draw_sprite(spr_health_bar, 2, draw_x + heart_width * 3, bar_y);
	
//}

draw_sprite(spr_health_bar, 3, x, y-1);
draw_set_alpha(1);