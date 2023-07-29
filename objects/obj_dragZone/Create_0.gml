/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Override
maxSize = 1;
face = CardFace.Up;
hidden = false;
name = "Drag";
movementMode = CardMovementMode.Instant;

function getCard() {
	if (isEmpty()) {
		return noone;
	}
	return cards[0];
}

function dragTo(zone) {
	if (getCard() != noone) {
		moveCard(getCard(), zone);
	}
}

// Override
refresh() {
	if(getSize() > 0) {
		card[0].depth += 100;
	}
}