/// @description Insert description here
// You can write your code in this editor
if (array_length(events) > 0 && !event_chain_running) {
	show_debug_message("Events chain started with " + string(events));
	start_event_chain();
}