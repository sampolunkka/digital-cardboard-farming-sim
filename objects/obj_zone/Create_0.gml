/// @description Generic Zone functions

maxSize = 5;
// cards = array_create(maxSize, noone);
cards = [];
hidden = false;
face = CardFace.Down;
name = "Generic zone";
movementMode = CardMovementMode.Fast;

function moveCard(card, zone) {
	//show_message("move card: " + string(card,id));
	if (zone.isFull()) {
		show_message("Zone is full!");
		return;
	}
	
	var ind = array_get_index(cards, card);
	if (ind >= 0) {
		removeCard(getCardIndex(card));
		//show_message("attempting to move card: " + string(card.id) + " to zone: " + zone.name );
		zone.addCard(card);
	}
}

function addCard(card) {
	//show_message("adding card: " + string(card.id) + "to zone: " + name);
	if (self.isFull()) {
		show_message("Zone is full!");
		return;
	}
	
	card.setFaceAndHidden(face, hidden);
	card.setMovement(movementMode);
	
	array_push(cards, card);
	refresh();
}

function removeCard(cardIndex) {
	array_delete(cards, cardIndex, 1);
	refresh();
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

function getSize() {
	return array_length(cards);
}

function isFull() {
	return array_length(cards) >= maxSize;
}

function isEmpty() {
	return array_length(cards) < 1;
}


function refresh() {
	
}