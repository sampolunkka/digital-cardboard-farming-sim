// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_global_text(){

}

function draw_text_shadow(tx, ty, str, _alpha) {
	_alpha = _alpha ?? 1;
	if (!is_string(str)){
		str = string(str); 	// Cast as string to prevent unintended behaviour
	}
	draw_set_alpha(_alpha);
	draw_set_color(c_black);
	draw_text(tx + 1, ty + 1, str);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_text(tx, ty, str);
}

function draw_text_shadow_color(tx, ty, str, color, _alpha) {
	_alpha = _alpha ?? 1;
	str = string(str); 	// Cast as string to prevent unintended behaviour
	draw_set_color(color);
	draw_text_shadow(tx, ty, str, _alpha);
}

function draw_damage(_x, _y, _damage) {
	draw_set_font(global.labelFont);
	var draw_x = _x;
	var string_w = string_width(_damage) - 1;
	draw_sprite(spr_damage, 0, draw_x, _y);
	draw_x += sprite_get_width(spr_damage);
	draw_sprite_stretched(spr_damage, 1, draw_x, _y, string_w, sprite_get_height(spr_damage));
	draw_sprite(spr_damage, 2, draw_x + string_w, _y);
	draw_text_shadow(draw_x, _y, string(_damage), 0.6);
}

function draw_heal(_x, _y, _heal) {
	draw_set_font(global.labelFont);
	var draw_x = _x;
	var string_w = string_width(_heal) - 1;
	draw_sprite(spr_heal, 0, draw_x, _y);
	draw_x += sprite_get_width(spr_heal);
	draw_sprite_stretched(spr_heal, 1, draw_x, _y, string_w, sprite_get_height(spr_heal));
	draw_sprite(spr_heal, 2, draw_x + string_w, _y);
	draw_text_shadow(draw_x, _y, string(_heal), 0.6)
}

function draw_card_draw(_x, _y, _amount) {
	draw_set_font(global.labelFont);
	var draw_x = _x;
	var string_w = string_width(_amount) - 1;
	draw_sprite(spr_draw, 0, draw_x, _y);
	draw_x += sprite_get_width(spr_draw);
	draw_sprite_stretched(spr_draw, 1, draw_x, _y, string_w, sprite_get_height(spr_draw));
	draw_sprite(spr_draw, 2, draw_x + string_w, _y);
	draw_text_shadow(draw_x, _y, string(_amount), 0.6);
}