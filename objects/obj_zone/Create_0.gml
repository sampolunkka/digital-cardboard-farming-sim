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

function moveCard(card, zone) {
	//show_message("move card: " + string(card,id));
	if (zone.isFull()) {
		show_message("Zone is full!");
		return;
	}
	
	var ind = array_get_index(cards, card);
	if (ind >= 0) {
		removeCardAtIndex(getCardIndex(card));
		//show_message("attempting to move card: " + string(card.id) + " to zone: " + zone.label );
		zone.addCard(card);
	}
}

function addCard(card) {
	//show_message("adding card: " + string(card.id) + "to zone: " + label);
	if (self.isFull()) {
		show_message("Zone is full!");
		return;
	}
	
	card.setFaceAndHidden(face, hidden);
	card.setMovement(movementMode);
	
	array_push(cards, card);
	card.owner = owner;
	on_add(card);
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

function insertCard(card, index) {
	var temp = cards;
	show_debug_message("insert card: " + mask_instance_ref(card) + " " + card.label + " to zone: " + mask_instance_ref(self) + " " + label);
	array_insert(temp, index, card);
	cards = temp;
	card.owner = owner;
	onInsert(card);
	refresh();
}

function onInsert(card) {
}

function on_add(card) {
}

function removeCardAtIndex(cardIndex) {
	array_delete(cards, cardIndex, 1);
	refresh();
}

function removeCard(card) {
	show_debug_message("Remove card " + card + " from zone " + label);
	var index = array_get_index(cards, card.instance_id);
	if (index < 0) {
		show_debug_message("card index <0");
	}
	var temp = cards;
	array_delete(temp, array_get_index(temp, card), 1);
	cards = temp;
	show_debug_message("cards: " + string(cards));
	refresh();
}

function deleteCard(card) {
	var temp = cards;
	array_delete(temp, getCardIndex(card), 1);
	show_debug_message("delete card: " + mask_instance_ref(card) + " " + card.label + " from zone: " + mask_instance_ref(self) + " " + label);
	cards = temp;
	refresh();
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
	// If cant move, return
	if (_to_zone.getSize() + array_length(cards) > _to_zone.max_size) {
		return;
	}
	
	for (var i = 0; i < array_length(cards); i++) {
		moveCard(cards[i], _to_zone);
	}
}

function refresh() {
	
}