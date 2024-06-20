/// @description Insert description here
// You can write your code in this editor

if (!fade_out) {
	// Select deck
	var _deck = collision_point(mouse_x, mouse_y, obj_collection_deck, false, true)
	if (_deck != noone) {
		if (array_length(_deck.cards) == _deck.max_cards) {
			active_deck = _deck;
			global.active_deck = active_deck.cards;
			show_debug_message("Active deck with card ids: " + string(global.active_deck));
			display_cards();
		}
	
		var confirm_button = instance_create_layer(room_width-34, y, "Instances", obj_deck_save_button);
		confirm_button.text = "Enter";
	}
	
	// On cancel
	var _cancel_button = collision_point(mouse_x, mouse_y, obj_deck_cancel_button, false, true);
	if (_cancel_button != noone) {
		room_goto(Main);
	}

	// On confirm
	var _confirm_button = collision_point(mouse_x, mouse_y, obj_deck_save_button, false, true);
	if (_confirm_button != noone) {
		fade_out = true;
	}
}
