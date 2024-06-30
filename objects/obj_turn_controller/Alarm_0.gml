/// @description Insert description here
// You can write your code in this editor
if (array_length(events) > 0) {
	events[0].trigger();
	array_delete(events, 0, 1);
	alarm[0] = event_timer;
} else {
	show_debug_message("Event chain stopped");
	event_chain_running = false
}