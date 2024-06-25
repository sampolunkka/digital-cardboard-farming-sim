/// @description Generic Zone functions

max_size = 5;
// cards = array_create(max_size, noone);
cards = [];
hidden = false;
face = CardFace.Down;
label = "Generic zone";
movementMode = CardMovementMode.Fast;

// Adding and inserting sets owner
owner = noone;

function hoverCard(card) {
	card.hover();
}

function on_enter_zone(_card) {
	// Set depth
	layer_add_instance(layer, _card);
	var depth_offset = 100 - _card.baseDepth % 100;
	show_debug_message(depth_offset);
	var target_depth = layer_get_depth(layer) - depth_offset;
	show_debug_message("Target depth: " + string(target_depth));
	_card.set_depth(target_depth);
	_card.depth = target_depth;
	
	// Set zone rules
	_card.face = face;
	_card.hidden = hidden;
	_card.setMovement(movementMode);
	
	// Set ownership
	_card.owner = owner;
}

function moveCard(_card, zone) {
	show_debug_message("Moving _card: " + string(_card,id));
	if (zone.isFull()) {
		show_debug_message("Zone " + zone.label + " is full!");
		return;
	}
	
	var ind = array_get_index(cards, _card);
	if (ind >= 0) {
		removeCardAtIndex(getCardIndex(_card));
		zone.addCard(_card);
		show_debug_message("Moved card: " + string(_card.id) + " to zone: " + zone.label );
	}
}

function addCard(_card) {
	//show_message("adding card: " + string(card.id) + "to zone: " + label);
	if (self.isFull()) {
		show_debug_message("Zone " + label + " is full!");
		return;
	}
	on_enter_zone(_card);	
	array_push(cards, _card);
	on_add(_card);
	refresh();
}

function swapCard(card, replacement, zone) {
	insertCard(replacement, getCardIndex(card));
	removeCard(card);
	
	zone.insertCard(card, zone.getCardIndex(replacement));
	zone.removeCard(card);
}

function replace_card(card, replacement) {
	insertCard(replacement, getCardIndex(card));
	removeCard(card);
}

function replace_card_at_index(index, replacement) {
	var card = array_get_index(cards, index);
	insertCard(replacement, index);
	instance_destroy(card);
}

function insertCard(_card, index) {
	var temp = cards;
	show_debug_message("insert card: " + mask_instance_ref(_card) + " " + _card.label + " to zone: " + mask_instance_ref(self) + " " + label);
	array_insert(temp, index, _card);
	cards = temp;
	on_enter_zone(_card);	
	on_insert(_card);
	refresh();
}

function on_insert(card) {
}

function on_add(card) {
}

function removeCardAtIndex(cardIndex) {
	array_delete(cards, cardIndex, 1);
	refresh();
}

function removeCard(card) {
	show_debug_message("Remove card " + string(card.label) + " from zone " + label);
	var index = array_get_index(cards, card);
	if (index < 0) {
		show_debug_message("card index <0 for card: " + card.label, " " + string(mask_instance_ref(card)));
	}
	array_delete(cards, array_get_index(cards, card), 1);

	show_debug_message("cards: " + string(cards));
	refresh();
}

function deleteCard(card) {
	removeCard(card);
	instance_destroy(card);
}

function popCard() {
	return array_pop(cards);
}

function getTopCard() {
	return array_last(cards);
}

function getCardIndex(card) {
	return array_get_index(cards, card);
}

function getIndexAtX(tx) {
	if (getSize() < 1) {
		return 0;
	}
	var index = 0;
	for (var i = 0; i < getSize(); i++) {
		//show_debug_message("cards is array: " + string(is_array(cards)) + " with values: " + string(cards));
		if (tx > cards[i].anchorX) {
			index = i;
		} else {
			break;
		}
	}
	return index;
}

function getSize() {
	return array_length(cards);
}

function getIndex(index) {
	if (getSize() < index + 1) {
		return noone;
	} else if (getSize() < 1) {
		return noone;
	}
	return cards[index];
}

function isFull() {
	return array_length(cards) >= max_size;
}

function isEmpty() {
	return array_length(cards) < 1;
}

function hasCard(card) {
	return getCardIndex(card) > -1;
}

function move_all_cards(_to_zone) {
	show_debug_message("Moving all cards to " + _to_zone.label + ", cards: " + string(cards));
	// If cant move, return
	if (_to_zone.getSize() + array_length(cards) > _to_zone.max_size) {
		return;
	}
	
	// Avoid side effects when array is resized
	var temp = [];
	array_copy(temp, 0, cards, 0, array_length(cards));
	for (var i = 0; i < array_length(temp); i++) {
		moveCard(temp[i], _to_zone);
	}
}

function refresh() {
	
}