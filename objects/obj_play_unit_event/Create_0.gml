/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

board = noone;
unit = noone;
board_index = 0;

function trigger() {
	var anim = instance_create_layer(unit.x, unit.y, "Underlay", obj_card_cast_animation);
	anim.card = unit;
	board.insertCard(unit, board_index);
}