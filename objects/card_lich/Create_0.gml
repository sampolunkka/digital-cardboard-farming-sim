/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

type = CardType.Unit;
label = "Lich";
cost = 3;
baseAttack = 2;
base_hp = 2;
max_hp = base_hp;
attack = baseAttack;
hp = base_hp;
on_play_actions = [];
info = label + "\nUnit: " + string(attack) + "/" + string(hp);
face_up_sprite = spr_card_lich;
on_board_sprite = spr_card_lich_small;
actions_string = ""
tags = [Tag.Mid, Tag.Ping];

// Sounds
on_play_sound = vox_undead_1_play;
on_attack_sound = vox_undead_1_attack;
on_death_sound = vox_undead_1_death;