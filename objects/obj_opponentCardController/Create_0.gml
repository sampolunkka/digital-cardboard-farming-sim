/// @description Insert description here
// You can write your code in this editor
deck = noone;
drag = noone;
hand = noone;
board = noone;

board = instance_create_depth(0,0,10,obj_boardZone);
board.y = 0;
board.addCard(instance_create_depth(0,0,0,card_noviceEngineer));
board.sprite_index = spr_boardOpponent;