/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

type = CardType.Unit;
label = "Ronin";
cost = 2;
baseAttack = 3;
attack = baseAttack;
base_hp = 2;
hp = base_hp;
on_play_actions = [];
info = string(cost) + " " + label + "\n" + "Unit: " + string(baseAttack) + "/" + string(base_hp);
portrait = spr_portrait_ronin;
face_up_sprite = spr_card_ronin;
on_board_sprite = spr_card_ronin_small;

// Vox
on_play_sound = vox_ronin_play;
on_attack_sound = vox_ronin_attack;
on_death_sound = vox_ronin_death;

