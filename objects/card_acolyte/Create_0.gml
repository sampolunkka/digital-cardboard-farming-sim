/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

label = "Acolyte";
cost = 3;
baseAttack = 2;
baseHp = 1;
attack = baseAttack;
hp = baseHp;
on_play_actions = [obj_drawAction];
info = "";
face_up_sprite = spr_card_acolyte;

function draw_actions() {
	var _text = "+Å";
	var relative_x = x + actions_x;
	var relative_y = y + actions_y;
	draw_sprite(spr_onplay, 0, relative_x, relative_y);
	draw_sprite_stretched(spr_card_digit_background,
		0,
		relative_x + sprite_get_width(spr_onplay),
		relative_y,
		string_width(_text),
		sprite_get_height(spr_card_digit_background)
	);
	draw_set_font(global.labelFont);
	draw_text(relative_x + sprite_get_width(spr_onplay), relative_y, _text);
}