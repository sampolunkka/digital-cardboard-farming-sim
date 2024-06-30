/// @description Insert description here
// You can write your code in this editor

enum Turn {
	PlayerTurn,
	OpponentTurn,
}

// Init
turn = irandom_range(Turn.PlayerTurn, Turn.OpponentTurn);
player = instance_nearest(0, 0, obj_player);
opponent = instance_nearest(0, 0, obj_opponent);

events = array_create();
event_timer = 60;
event_chain_running = false;

function start_turn() {
	switch(turn) {
		case Turn.PlayerTurn: start_player_turn(); break;
		case Turn.OpponentTurn: start_opponent_turn(); break;
	}
}

function start_player_turn() {
	show_debug_message("Start player turn");
	player.add_resource_full();
	player.draw();
	player.refresh();
	
	var controller = player.get_controller();
	controller.board.remove_fatigue();
}

function start_opponent_turn() {
	show_debug_message("Start opponent turn");
	opponent.add_resource_full();
	opponent.draw();
	opponent.refresh();
	var controller = opponent.get_controller();
	controller.board.remove_fatigue();
	controller.start_turn();
}

function end_turn() {
	switch(turn) {
		case Turn.PlayerTurn: turn = Turn.OpponentTurn; break;
		case Turn.OpponentTurn: turn = Turn.PlayerTurn; break;
	}
	start_turn();
}

function push_event(_event) {
	array_push(events, _event);
}

function start_event_chain() {
	event_chain_running = true;
	alarm[0] = event_timer;
}