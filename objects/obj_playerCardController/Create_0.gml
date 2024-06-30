/// @description Insert description here
// You can write your code in this editor
// ZONES
deck = noone;
drag = noone;
hand = noone;
grave = noone;
highlight_zone = noone;
board = noone;
mulligan = noone;
commander = noone;

drag_hand_index = -1;

// CONTROLLERS
turn_controller = noone;

function draw() {
	audio_play_sound(snd_card_draw, 1, false);
	var topCard = deck.getTopCard();
	if (topCard != undefined && topCard != noone) {
		deck.moveCard(deck.getTopCard(), hand);
	}
}

function select(card) {
	// Check if in hand
	if (hand.hasCard(card)) {
			drag_hand_index = hand.getCardIndex(card);
			pick(card);
	// Check if on board
	} else if (board.hasCard(card)) {
		if (!card.fatigued && !instance_exists(obj_targeting_controller)) {
			var trgt_con = instance_create_layer(card_get_center_x(card), card_get_center_y(card), "Overlay", obj_targeting_controller);
			trgt_con.init_with(card, card.target_type);
		}
	}
}

function pick(card) {
	if (card == noone) {
		return;
	}
	hand.moveCard(card, drag);
	audio_play_sound(snd_card_grab, 1, false);
}

function place() {
	if (collision_point(mouse_x, mouse_y, board, true, true)) {
		play_card();
	} else if (collision_point(mouse_x, mouse_y, hand, false, true)) {
		audio_play_sound(snd_card_move, 1, false);
		placeAtPlaceholder(hand);
	}
}

function play_unit(_card) {
	if (instance_exists(obj_placeholderCard)) {
		if (commander.payForCard(_card)) {
			var turn_controller = instance_nearest(x, y, obj_turn_controller);
			var play_unit_event = instance_create_layer(x, y, "Instances", obj_play_unit_event);
			play_unit_event.board = board;
			play_unit_event.unit = _card;
			play_unit_event.board_index = board.getIndexAtX(mouse_x);
			turn_controller.push_event(play_unit_event);
			drag.removeCardAtIndex(0);
			instance_destroy(obj_placeholderController);
		}
	}
}

function play_spell(_card) {
	if (_card.targeted) {
		drag.moveCard(_card, highlight_zone);
		var targeting_controller = instance_create_layer(highlight_zone.x, highlight_zone.y, "Instances", obj_targeting_controller);
		targeting_controller.init_with(_card, _card.target_type, hand, grave);
	} else {
		if (commander.payForCard(_card)) {
			drag.moveCard(_card, highlight_zone);
			_card.on_cast(noone, hand, grave);
			highlight_zone.move_to_grave_delayed();
		}
	}
}

function place_in_hand(_card) {
		audio_play_sound(snd_card_move, 1, false);
		hand.insertCard(_card, hand.getIndexAtX(mouse_x));
		drag.removeCardAtIndex(0);
		instance_destroy(obj_placeholderController);
}

function play_card() {
	var card = drag.getCard();
	var zone = board;
	if (instance_exists(obj_placeholderCard)) {
		if (commander.payForCard(card)) {
			var anim = instance_create_layer(card.x, card.y, "Underlay", obj_card_cast_animation);
			anim.card = card;
			card.setMovement(zone.movementMode);
			zone.insertCard(drag.getCard(), zone.getIndexAtX(mouse_x));
			drag.removeCardAtIndex(0);
			instance_destroy(obj_placeholderController);
		}
	}
}

function placeAtPlaceholder(zone) {
	if (instance_exists(obj_placeholderCard)) {
		var card = drag.getCard();
		card.setMovement(zone.movementMode);
		zone.insertCard(drag.getCard(), zone.getIndexAtX(mouse_x));
		drag.removeCardAtIndex(0);
		instance_destroy(obj_placeholderController);
	}
}

function createPlaceholderController(zone) {
	if (zone.isFull()) {
		return;
	}
	if (!instance_exists(obj_placeholderController)) {
		var ph = instance_create_layer(x, y, "Instances", obj_placeholderController);
		ph.zone = zone;
		ph.createPlaceholder();
	}
}

// TODO: Return to placeholder
function returnToHand() {
	drag.moveCard(drag.getCard(), hand);
}

function getTopmostHoveredCard() {
	var cardCollisions = ds_list_create();
	var collisionCount = collision_point_list(mouse_x, mouse_y, obj_card, false, true, cardCollisions, true);
	
	// Remove dragged card from collisions
	if (!drag.isEmpty()) {
		if (drag.getTopCard != undefined && drag.getTopCard != noone) {
			ds_list_delete(cardCollisions, ds_list_find_index(cardCollisions, drag.getTopCard));
			collisionCount--;
		}
	}
	
	var card = noone;
	
	if (collisionCount > 0) {
		card = ds_list_find_value(cardCollisions, 0);
	}
	ds_list_destroy(cardCollisions);
	return card;
}

function getHoveredCardInZone(zone) {
	var card = getTopmostHoveredCard();
	if (zone.hasCard(card)) {
		return card;
	} else {
		return noone;
	}
}

function init_with(_card_ids, _commander) {
	commander = _commander;
	deck = instance_create_layer(203, 118, "Board", obj_deckZone);
	drag = instance_create_layer(x, y, "Drag", obj_dragZone);
	hand = instance_create_layer(x, y, "Hand", obj_handZone);
	grave = instance_create_layer(x, y, "Instances", obj_hiddenZone);
	highlight_zone = instance_create_layer(4, y - room_height/2, "Hand", obj_highlight_zone);
	board = instance_create_layer(8, 71, "Board", obj_boardZone);
	
	// Init board
	board.image_xscale = 28;
	board.image_yscale = 4;
	
	// Init highlight zone
	highlight_zone.init_with(grave);
	
	// Init deck
	deck.init_with(_card_ids);
	deck.refresh();
	
	// Set ownership of zones
	deck.owner = obj_player;
	drag.owner = obj_player;
	hand.owner = obj_player;
	board.owner = obj_player;
	grave.owner = obj_player;
	highlight_zone.owner = obj_player;
	
	// Init mulligan and turn controller
	mulligan = instance_create_layer(x, y, "Board", obj_mulligan_zone);
	turn_controller = instance_create_layer(x, y, "Instances", obj_turn_controller);
	
	mulligan.init_with(deck, hand, turn_controller);
}