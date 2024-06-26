/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

type = CardType.Unit;
label = "Ghoul";
cost = 1;
baseAttack = 2;
base_hp = 1;
max_hp = base_hp;
attack = baseAttack;
hp = base_hp;
on_play_actions = [];
info = label +"\nUnit: 2/1";
face_up_sprite = spr_card_ghoul;
on_board_sprite = spr_card_ghoul_small;
actions_string = ""
tags = [Tag.Early];

// Sounds
on_play_sound = vox_undead_1_play;
on_attack_sound = vox_undead_1_attack;
on_death_sound = vox_undead_1_death;