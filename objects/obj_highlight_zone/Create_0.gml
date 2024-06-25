/// @description Insert description here
// You can write your code in this editor
event_inherited();

max_size = 1;
movementMode = CardMovementMode.Slower;
grave = noone;
destroy_delay = 60;
face = CardFace.Up;

function on_insert(card) {
	card.set_position(x, y);
}

function on_add(card) {
	card.set_position(x, y);
}

function move_to_grave_delayed() {
	alarm[0] = destroy_delay;
}

function init_with(_grave) {
	grave = _grave;
}