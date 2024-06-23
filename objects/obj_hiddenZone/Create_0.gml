/// @description Insert description here
// You can write your code in this editor
event_inherited();

hidden = true;


function on_insert(card) {
	card.hidden = hidden;
	instance_deactivate_object(card);
}

function on_add(card) {
	card.hidden = hidden;
	instance_deactivate_object(card);
}