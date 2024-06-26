/// @description Insert description here
// You can write your code in this editor
deck = instance_create_layer(7, -20, "Instances", obj_deckZone);
drag = instance_create_layer(4, y - room_height/2, "Hand", obj_dragZone);
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

commander = noone;

for (var i = 0; i < array_length(board.cards); i++) {
	board.cards[i].onSummon();
}

board.sprite_index = spr_redHitbox;

function start_turn() {
	determine_next_action();
}

function draw() {
	audio_play_sound(snd_card_draw, 1, false);
	var topCard = deck.getTopCard();
	if (topCard != undefined && topCard != noone) {
		deck.moveCard(deck.getTopCard(), hand);
	}
}

function play_card() {
	var card = hand.getIndex(irandom_range(0, hand.getSize()-1));
	hand.moveCard(card, drag);
	if (commander.payForCard(card)) {
		var anim = instance_create_layer(card.x, card.y, "Underlay", obj_card_cast_animation);
		anim.card = card;
		drag.moveCard(drag.getTopCard(), board);
	}
}

function init_with(_card_ids, _commander) {
	commander = _commander;
	deck.init_with(_card_ids);
	deck.draw(hand, 4);
	turn_controller = instance_nearest(0, 0, obj_turn_controller);
}

function determine_next_action() {
	var hand_cards = hand.cards;
	var highest_playable = get_highest_playable();
	
}

function get_highest_playable() {
	var highest_playable = noone;
	for (var i = 0; i < array_length(hand.cards); i++) {
		var card = hand.cards[i];
		if (i = 0) {
			highest_playable = card;
		} else if (card.cost > highest_playable) {
			highest_playable = card;
		}
	}
}