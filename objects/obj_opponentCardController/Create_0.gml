/// @description Insert description here
// You can write your code in this editor
deck = instance_create_layer(7, -20, "Instances", obj_deckZone);
drag = instance_create_layer(4, y - room_height/2, "Hand", obj_dragZone);
hand = instance_create_layer(x, y, "Instances", obj_opponent_hand_zone);
board = instance_create_layer(8, 34, "Board", obj_boardZone);
grave = instance_create_layer(0, 0, "Instances", obj_hiddenZone);

	
// Init board
board.image_xscale = 28;
board.image_yscale = 4;

deck.owner = obj_opponent;
hand.owner = obj_opponent;
board.owner = obj_opponent;
grave.owner = obj_opponent;

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

function init_with(_card_ids, _commander) {
	commander = _commander;
	deck.init_with(_card_ids);
	turn_controller = instance_nearest(0, 0, obj_turn_controller);
	do_mulligan();
}

function determine_next_action() {
	var hand_cards = hand.cards;
	var highest_playable = get_highest_playable();
	var took_action = false;
	
	// Play cards if able
	if (highest_playable != noone) {
		play_card(highest_playable);
		took_action = true;
	// Attack if able
	} else {

	}
	
	if (took_action == false) {
		alarm[0] = 30;
	} else {
		alarm[1] = 30;
	}
}

function get_highest_playable() {
	if (hand.isEmpty()) {
		return noone;
	}
	var highest_playable = noone;
	var highest_playable_cost = 0;
	for (var i = 0; i < array_length(hand.cards); i++) {
		var card = hand.cards[i];
		if (card.cost > highest_playable_cost && commander.resource >= card.cost) {
			highest_playable = card;
			highest_playable_cost = card.cost;
		}
	}
	return highest_playable;
}

function play_card(_card) {
	if (commander.payForCard(_card)) {
		var anim = instance_create_layer(_card.x, _card.y, "Underlay", obj_card_cast_animation);
		anim.card = _card;
		hand.moveCard(_card, board);
	}
}

function do_mulligan() {
	var len = deck.getSize();
	var mulligan_cards = array_create(6);
	var keep_cards = array_create();
	var ind = 0;
	for (var i = len - 1; i > len - 7; i--) {
		if (array_length(keep_cards) == 4) {
			break;
		}
		var card = deck.cards[i];
		mulligan_cards[ind] = deck.cards[i];
		ind++;
		var tags = card.tags;
		
		// Mulligan strategy: Keep all early
		if (array_contains(tags, Tag.Early)) {
			array_push(keep_cards, card);
		}
	}
	show_debug_message("Opponent mulligan selection: " + string(mulligan_cards));
	
	// If keep is smaller than 4, randomly keep the rest
	var keep_len = array_length(keep_cards);
	if (keep_len < 4) {
		for (var i = 0; i < array_length(mulligan_cards); i++) {
			var card = mulligan_cards[i];
			if (!array_contains(keep_cards, card)) {
				array_push(keep_cards, card);
				if (array_length(keep_cards) == 4) {
					break;
				}
			}
		}
	}
	
	show_debug_message("Opponent kept: " + string(keep_cards));
	
	// Add cards to hand
	for (var i = 0; i < 4; i++) {
		deck.moveCard(keep_cards[i], hand);
	}
}