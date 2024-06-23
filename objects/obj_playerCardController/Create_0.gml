/// @description Insert description here
// You can write your code in this editor
// ZONES
deck = noone;
drag = noone;
hand = noone;
grave = noone;
board = instance_nearest(x, y, obj_boardZone);
mulligan = noone;

drag_hand_index = -1;

// CONTROLLERS
turnController = noone;

function draw() {
	var topCard = deck.getTopCard();
	if (topCard != undefined && topCard != noone) {
		deck.moveCard(deck.getTopCard(), hand);
	}
}

function select(card) {

	// Check if in hand
	if (hand.hasCard(card)) {
		if (card.type == CardType.Unit) {
			drag_hand_index = hand.getCardIndex(card);
			pick(card);
		} else if (card.type == CardType.Spell) {
			if (card.targeted) {
				var trgt_con = instance_create_depth(card_get_center_x(card), card_get_center_y(card) ,0,obj_targeting_controller);
				trgt_con.init(card, card.target_type, hand, grave);
			} else {
				card.on_cast(noone, hand, grave);
			}
		}
	// Check if on board
	} else if (board.hasCard(card)) {
		if (!card.fatigued && !instance_exists(obj_targeting_controller)) {
			var trgt_con = instance_create_depth(card_get_center_x(card), card_get_center_y(card) ,0,obj_targeting_controller);
			trgt_con.init(card);
		}
	}
}

function pick(card) {
	if (card == noone) {
		return;
	}
	hand.moveCard(card, drag);
}

function place() {
	if (collision_point(mouse_x, mouse_y, board, true, true)) {
		//placeAtPlaceholder(board);
		playCard();
	} else if (collision_point(mouse_x, mouse_y, hand, false, true)) {
		placeAtPlaceholder(hand);
	}
}

function playCard() {
	var card = drag.getCard();
	var zone = board;
	var player = player_get_active();
	if (instance_exists(obj_placeholderCard)) {
		if (player.payForCard(card)) {
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
		var ph = instance_create_depth(x, y, 0, obj_placeholderController);
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

function init() {
	deck = instance_create_depth(203, 118, 0, obj_deckZone);
	drag = instance_create_depth(x, y, 0, obj_dragZone);
	hand = instance_create_depth(x, y, 0, obj_handZone);
	grave = instance_create_depth(x, y, 0, obj_hiddenZone);
	
	mulligan = instance_create_layer(x, y, "Instances", obj_mulligan_zone);
	turnController = instance_create_depth(x, y, 0, obj_turnController);
	
	mulligan.init_with(deck, hand, turnController);
	
	// Set ownership of zones
	deck.owner = obj_player;
	drag.owner = obj_player;
	hand.owner = obj_player;
	board.owner = obj_player;
	grave.owner = obj_player;

	
	/*for (var i=0; i < deck.max_size; i++) {
		//show_message("controller adding card: " + string(i));
		deck.addCard(instance_create_depth(x, y, 0, obj_card));
	}*/
}

init();