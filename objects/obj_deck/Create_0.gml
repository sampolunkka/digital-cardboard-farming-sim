/// @description Insert description here
// You can write your code in this editor
cards = array_create(50, noone);
shuffleTimer = 0;
shuffleTimerMax = 25;
shuffling = false;
x = room_width - 34;
y = room_height - 44;

function initDeck() {
	cards = array_create(50, noone);
	for(var i = 0; i < array_length(cards); i++) {
		cards[i] = obj_field;
	}
}

function drawCard() {
	if (getDeckSize() < 1) {
		return;
	}
	if (hand != noone && !hand.isFull()) {
		hand.addCard(array_pop(cards));
	}
}

function getDeckSize() {
	return array_length(cards);
}

initDeck();