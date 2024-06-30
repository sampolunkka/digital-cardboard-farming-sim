/// @description Insert description here
// You can write your code in this editor
if (array_length(events) > 0) {
	events[0].trigger();
	alarm[0] = events[0].timer;
	array_delete(events, 0, 1);
} else {
	show_debug_message("Event chain stopped");
	for (var i = 0; i < instance_number(obj_board); i++) {
		instance_find(obj_board, i).refresh();
	}
	event_chain_running = false
}