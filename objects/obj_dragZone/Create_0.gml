/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Override
max_size = 1;
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
function refresh() {
	if(getSize() > 0) {
		cards[0].depth -= 100;
	}
}

function on_insert(card) {
	card.interaction = Interaction.Grabbing;
}

function on_add(card) {
	card.interaction = Interaction.Grabbing;
}