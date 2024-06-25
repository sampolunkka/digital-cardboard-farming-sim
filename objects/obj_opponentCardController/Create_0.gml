/// @description Insert description here
// You can write your code in this editor
deck = instance_create_layer(7, -20, "Instances", obj_deckZone);
drag = noone;
hand = instance_create_layer(x, y, "Instances", obj_opponent_hand_zone);
board = instance_create_layer(8, 34, "Board", obj_boardZone);
	
// Init board
board.image_xscale = 28;
board.image_yscale = 4;

deck.owner = obj_opponent;
hand.owner = obj_opponent;
board.owner = obj_opponent;

deck.x = 0;
deck.y = 0;

for (var i = 0; i < array_length(board.cards); i++) {
	board.cards[i].onSummon();
}

board.sprite_index = spr_redHitbox;

function start_turn() {
	if (!board.isFull()) {
		play_card();
	}
}

function draw() {
	audio_play_sound(snd_card_draw, 1, false);
	var topCard = deck.getTopCard();
	if (topCard != undefined && topCard != noone) {
		deck.moveCard(deck.getTopCard(), hand);
	}
}

function play_card() {
	var card = hand.getTopCard();
	card.face = CardFace.Up;
	var anim = instance_create_layer(card.x, card.y, "Underlay", obj_card_cast_animation);
	anim.card = card;
	card.setMovement(board.movementMode);
	hand.moveCard(card, board);
}

function init_with(_card_ids) {
	deck.init_with(_card_ids);
}