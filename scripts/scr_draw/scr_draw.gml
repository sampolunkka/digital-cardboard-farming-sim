// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_global_text(){

}

enum OverlayType {
	Attack,
	Damage,
	Draw,
	Heal,
	Hp,
	Mana,
	NamePlate,
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

function draw_overlay_value(_x, _y, _amount, _type) {
	var sprite;
	
	switch (_type) {
		case OverlayType.Attack: sprite = spr_attack; break;
		case OverlayType.Damage: sprite = spr_damage; break;
		case OverlayType.Draw: sprite = spr_draw; break;
		case OverlayType.Hp: sprite = spr_hp; break;
		case OverlayType.Heal: sprite = spr_heal; break;
		case OverlayType.Mana: sprite = spr_mana; break;
		case OverlayType.NamePlate: sprite = spr_name_plate; break;
	}
	
	var draw_x = _x;
	var string_w = string_width(_amount) - 1;
	draw_sprite(sprite, 0, draw_x, _y);
	draw_x += sprite_get_width(sprite);
	draw_sprite_stretched(sprite, 1, draw_x, _y, string_w, sprite_get_height(sprite));
	draw_sprite(sprite, 2, draw_x + string_w, _y);
	draw_text_shadow(draw_x, _y, string(_amount), 0.6);
}

function draw_attack(_x, _y, _amount) {
	draw_overlay_value(_x, _y, _amount, OverlayType.Attack)
}

function draw_hp(_x, _y, _amount) {
	draw_overlay_value(_x, _y, _amount, OverlayType.Hp)
}

function draw_mana(_x, _y, _amount) {
	draw_overlay_value(_x, _y, _amount, OverlayType.Mana);
}

function draw_name_plate(_x, _y, _string) {
	draw_overlay_value(_x, _y, _string, OverlayType.NamePlate);
}

function draw_pip_path(_path) {
	var _pathLength = path_get_length(_path);
	var _spacing = 8;
	var _dots = _pathLength / _spacing;

	var i = 0;
	repeat(_dots) {
		draw_set_alpha(max(0.6, 1 - i/_dots));
	    var _pos = i / _dots;
	    draw_sprite(spr_targeting_bip, 0, path_get_x(_path, _pos), path_get_y(_path, _pos));
	    ++i;
	}
	draw_set_alpha(1);
	var reticule_x = path_get_point_x(_path, 1);
	var reticule_y = path_get_point_y(_path, 1);
	draw_sprite(spr_targeting_end, 0, reticule_x, reticule_y);
}