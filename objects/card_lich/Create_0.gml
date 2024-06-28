/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

type = CardType.Unit;
label = "Lich";
cost = 3;
baseAttack = 1;
base_hp = 1;
max_hp = base_hp;
attack = baseAttack;
hp = base_hp;
on_play_actions = [];
info = "Lich\nOn play: Deal 1 damage to all enemies.";
face_up_sprite = spr_card_lich;
on_board_sprite = spr_card_lich_small;
actions_string = ""
tags = [Tag.Mid, Tag.Ping];

// Sounds
on_play_sound = vox_undead_1_play;
on_attack_sound = vox_undead_1_attack;
on_death_sound = vox_undead_1_death;

// On play
damage = 1;

function trigger_on_play() {
	for (var i = 0; i < instance_number(obj_unit_card); i++) {
		var unit = instance_find(obj_unit_card, i);
		if (unit.owner != owner && unit.on_board) {
			unit.deal_damage(damage);
		}
	}
	var anim = instance_create_layer(card_get_center_x(id), card_get_center_y(id), "Animations", obj_lich_on_play_animation);
	anim.card = id;
}

function draw_effect(_x, _y) {
	//draw_text_shadow(_x, _y, "E");
	draw_sprite_ext(spr_effect_underlay, 0, x, y + sprite_height - sprite_get_height(spr_effect_underlay), 1, 1, 0, c_white, 0.6);
	draw_damage(_x, _y, "E!1");
}
