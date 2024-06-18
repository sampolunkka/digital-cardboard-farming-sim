/// @description Insert description here
// You can write your code in this editor
deck = noone;
drag = noone;
hand = noone;
board = instance_nearest(x, y, obj_boardZone);

//	deck.owner = obj_opponent;
//	drag.owner = obj_opponent;
//	hand.owner = obj_opponent;
board.owner = obj_opponent;

board.addCard(instance_create_depth(0,0,0,card_acolyte));
board.addCard(instance_create_depth(0,0,0,card_acolyte));
board.addCard(instance_create_depth(0,0,0,card_acolyte));
board.addCard(instance_create_depth(0,0,0,card_acolyte));

for (var i = 0; i < array_length(board.cards); i++) {
	board.cards[i].onSummon();
}

board.sprite_index = spr_redHitbox;