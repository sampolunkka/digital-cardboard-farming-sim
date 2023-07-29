/// @description Insert description here
// You can write your code in this editor

show_debug_message("cursor created");
window_set_cursor(cr_none);
cursor_sprite = spr_cursor;

if (hand == noone) {
	show_message("No hand found! Exiting game..");
	exit;
}

// Object state
state = "free";

/// @description Insert description here
// You can write your code in this editor
draggable = obj_card;
draggedCard = noone;

dragOffsetX = 0;
dragOffsetY = 0;

highlightedCard = noone;
previousHighlightedCard = noone;

function init() {
	draggedCard = noone;
	dragOffsetX = 0;
	dragOffsetY = 0;
	if (instance_number(obj_boardCursor) > 1) {
		instance_destroy();
	}
}

function controlInGameDrag() {
	var card = getCardCollisions();
	if (card != noone) {
		if (hasDraggedCard() && !card.isOnBoard) {
			state = "dragging";
			hand.movePlaceHolder(card.handIndex);
			return;
		} else if (card.isInHand()) {
			state = "highlighting";
			highlightedCard = card;
			hand.highlightCard(card.handIndex);
			return;
		}
	}
}

function controlDeckManagerDrag() {
	var card = getCardCollisions();
	if (card != noone) {
		card.shine = true;
	}
}

function getCardCollisions() {
	var cardCollisions = ds_list_create();
	var _num = collision_point_list(mouse_x, mouse_y, obj_card, false, true, cardCollisions, true);
	
	//prevent collision with dragged card
	if (draggedCard != noone) {
		ds_list_delete(cardCollisions, ds_list_find_index(cardCollisions, draggedCard));
		_num--;
	}
	
	var card = noone;
	
	if (_num > 0) {
		card = ds_list_find_value(cardCollisions, 0);
	}
	ds_list_destroy(cardCollisions);
	return card;
}

function hasDraggedCard() {
	return draggedCard != noone;
}

function hasHighlightedCard() {
	return highlightedCard != noone;
}