/// @description Insert description here
// You can write your code in this editor

phases = [];
player = instance_nearest(x, y, obj_player);
opponent = instance_nearest(x, y, obj_opponent);

function startTurn() {
	array_push(phases, obj_playerPhase);
	startNextPhase();
}

function startNextPhase() {
	if (array_length(phases) > 0) {
		instance_create_depth(0,0,0,array_pop(phases));
	}
}

function endTurn() {
	show_debug_message("ending turn..");
	startTurn();
}