/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

type = CardType.Unit;
label = "Terror";
cost = 4;
baseAttack = 5;
base_hp = 4;
max_hp = base_hp;
attack = baseAttack;
hp = base_hp;
on_play_actions = [];
info = label + "\nUnit: " + string(attack) + "/" + string(hp);
face_up_sprite = spr_card_terror;
on_board_sprite = spr_card_terror_small;
actions_string = ""
tags = [Tag.Mid];

// Sounds
on_play_sound = vox_monster_1_play;
on_attack_sound = vox_monster_1_attack;
on_death_sound = vox_monster_1_death;