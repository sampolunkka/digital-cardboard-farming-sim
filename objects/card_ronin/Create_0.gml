/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

type = CardType.Unit;
label = "Ronin";
cost = 2;
baseAttack = 3;
attack = baseAttack;
baseHp = 2;
hp = baseHp;
on_play_actions = [];
info = string(cost) + " " + label + "\n" + "Unit: " + string(baseAttack) + "/" + string(baseHp);
portrait = spr_portrait_ronin;
face_up_sprite = spr_card_ronin;
on_board_sprite = spr_card_ronin_small;

