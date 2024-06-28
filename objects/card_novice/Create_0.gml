/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

type = CardType.Unit;
label = "Novice";
cost = 3;
baseAttack = 2;
base_hp = 1;
attack = baseAttack;
hp = base_hp;
on_play_actions = [obj_drawAction];
info = "Novice\nUnit: 2/1\nOn play: draw a card";
face_up_sprite = spr_card_novice;
on_board_sprite = spr_card_novice_small;
actions_string = "§+$"

// Sounds
on_play_sound = vox_acolyte_play;
on_attack_sound = vox_acolyte_attack;
on_death_sound = vox_acolyte_death;

function trigger_on_play() {
	var commander = instance_nearest(0, 0, owner);
	owner.draw();
}