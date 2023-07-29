/// @description Insert description here
// You can write your code in this editor

deck = noone;
drag = noone;
hand = noone;
board = noone;

function draw() {
	deck.moveCard(deck.getTopCard(), hand);
}

function pick() {
	var card = getTopmostHoveredCard();
	if (card == noone) {
		return;
	}
	hand.moveCard(card, drag);
}

function place() {
	if (collision_point(mouse_x, mouse_y, obj_boardZone, true, true)) {
		drag.dragTo(board);
	}
}

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

function init() {
	deck = instance_create_depth(x, y, 0, obj_deckZone);
	drag = instance_create_depth(x, y, 0, obj_dragZone);
	hand = instance_create_depth(x, y, 0, obj_handZone);
	board = instance_create_depth(x, y, 0, obj_boardZone);
	
	for (var i=0; i < 10; i++) {
		//show_message("controller adding card: " + string(i));
		deck.addCard(instance_create_depth(x, y, 0, obj_playCard));
	}
}

init();