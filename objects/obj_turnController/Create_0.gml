/// @description Insert description here
// You can write your code in this editor

phases = [];

function startTurn() {
	init();
	startNextPhase();
}

function startNextPhase() {
	if (array_length(phases) > 0) {
		instance_create_depth(0,0,0,array_pop(phases));
	}
}

function endTurn() {
	//show_message("ending turn..");
	startTurn();
}

function init() {
	array_push(phases, obj_playerPhase);
}

init();