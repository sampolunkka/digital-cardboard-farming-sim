/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Override
maxSize = 1;
face = CardFace.Up;
hidden = false;
label = "Drag";
movementMode = CardMovementMode.Instant;

function getCard() {
	if (isEmpty()) {
		return noone;
	}
	return cards[0];
}

// Override
refresh() {
	if(getSize() > 0) {
		card[0].depth += 100;
	}
}