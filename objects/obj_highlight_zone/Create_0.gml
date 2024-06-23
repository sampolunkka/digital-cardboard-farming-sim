/// @description Insert description here
// You can write your code in this editor
event_inherited();

movementMode = CardMovementMode.Slower;

function on_insert(card) {
	card.set_position(x, y);
}

function on_add(card) {
	card.set_position(x, y);
}