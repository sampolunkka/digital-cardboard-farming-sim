/// @description Generic Zone functions

maxSize = 5;
// cards = array_create(maxSize, noone);
cards = [];
hidden = false;
face = CardFace.Down;
title = "Generic zone";
movementMode = CardMovementMode.Fast;

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
		removeCard(getCardIndex(card));
		//show_message("attempting to move card: " + string(card.id) + " to zone: " + zone.title );
		zone.addCard(card);
	}
}

function addCard(card) {
	//show_message("adding card: " + string(card.id) + "to zone: " + title);
	if (self.isFull()) {
		show_message("Zone is full!");
		return;
	}
	
	card.setFaceAndHidden(face, hidden);
	card.setMovement(movementMode);
	
	array_push(cards, card);
	refresh();
}

function swapCard(card, replacement, zone) {
	// may cause index = -1, therefore use max(0, ind)
	self.insertCard(replacement, max(0, self.getCardIndex(card)));
	self.removeCard(max(0, self.getCardIndex(card)));
	zone.insertCard(card, max(0, zone.getCardIndex(replacement)));
	zone.removeCard(max(0, zone.getCardIndex(replacement)));
}

function insertCard(card, index) {
	onInsert(card);
	//show_message("inserting card: " + string(card.id));
	array_insert(cards, index, card);
	refresh();
}

function onInsert(card) {
}

function removeCard(cardIndex) {
	array_delete(cards, cardIndex, 1);
	refresh();
}

function deleteCard(card) {
	removeCard(getCardIndex(card));
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
	return array_length(cards) >= maxSize;
}

function isEmpty() {
	return array_length(cards) < 1;
}

function hasCard(card) {
	return getCardIndex(card) > -1;
}

function refresh() {
	
}