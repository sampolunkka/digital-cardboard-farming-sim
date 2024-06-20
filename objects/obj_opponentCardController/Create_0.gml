/// @description Insert description here
// You can write your code in this editor
deck = instance_create_layer(7, -20, "Instances", obj_deckZone);
drag = noone;
hand = instance_create_layer(x, y, "Instances", obj_opponent_hand_zone);
board = instance_nearest(x, y, obj_boardZone);
/*
hand.addCard(instance_create_layer(x, y, "Instances", card_acolyte));
hand.addCard(instance_create_layer(x, y, "Instances", card_acolyte));
*/
deck.owner = obj_opponent;
//drag.owner = obj_opponent;
hand.owner = obj_opponent;
board.owner = obj_opponent;

deck.x = 0;
deck.y = 0;
/*
board.addCard(instance_create_depth(0,0,0,card_acolyte));
board.addCard(instance_create_depth(0,0,0,card_acolyte));
board.addCard(instance_create_depth(0,0,0,card_acolyte));
board.addCard(instance_create_depth(0,0,0,card_acolyte));
*/
for (var i = 0; i < array_length(board.cards); i++) {
	board.cards[i].onSummon();
}

board.sprite_index = spr_redHitbox;