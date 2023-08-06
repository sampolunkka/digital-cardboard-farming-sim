/// @description Insert description here
// You can write your code in this editor
// ZONES
deck = noone;
drag = noone;
hand = noone;
board = noone;

// CONTROLLERS
turnController = noone;

function draw() {
	deck.moveCard(deck.getTopCard(), hand);
}

function select(card) {
	//show_message("select on card: " + string(card.id));
	if (hand.hasCard(card)) {
		//show_message("hand has card");
		pick(card);
	} else if (board.hasCard(card)) {
		if (!instance_exists(obj_combatController)) {
			var combtCon = instance_create_depth(0,0,0,obj_combatController);
			combtCon.init(card);
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
			drag.removeCard(0);
			instance_destroy(obj_placeholderController);
		}
	}
}

function placeAtPlaceholder(zone) {
	if (instance_exists(obj_placeholderCard)) {
		var card = drag.getCard();
		card.setMovement(zone.movementMode);
		zone.insertCard(drag.getCard(), zone.getIndexAtX(mouse_x));
		drag.removeCard(0);
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
	var collisionCount = collision_point_list(mouse_x, mouse_y, obj_playCard, false, true, cardCollisions, true);
	
	// Remove dragged card from collisions
	if (!drag.isEmpty()) {
		ds_list_delete(cardCollisions, ds_list_find_index(cardCollisions, drag.getTopCard));
		collisionCount--;
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
	deck = instance_create_depth(x, y, 0, obj_deckZone);
	drag = instance_create_depth(x, y, 0, obj_dragZone);
	hand = instance_create_depth(x, y, 0, obj_handZone);
	board = instance_create_depth(x, y, 0, obj_boardZone);
	turnController = instance_create_depth(x, y, 0, obj_turnController);
	
	/*for (var i=0; i < deck.maxSize; i++) {
		//show_message("controller adding card: " + string(i));
		deck.addCard(instance_create_depth(x, y, 0, obj_playCard));
	}*/
}

init();