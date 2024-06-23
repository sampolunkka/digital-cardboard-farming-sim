/// @description Insert description here
// You can write your code in this editor

var save_btn = collision_point(mouse_x, mouse_y, obj_deck_save_button, false, true);
var cancel_btn = collision_point(mouse_x, mouse_y, obj_deck_cancel_button, false, true);
var card = collision_point(mouse_x, mouse_y, obj_card, false, true);

if (save_btn != noone) {
	deck_save(deck_id, cards_list);
	deck_picker.update();
	destroy_delayed();
} else if (cancel_btn != noone) {
	destroy_delayed();
} else if (card != noone) {
	if (array_get_index(card_instances, card) > -1) {
		show_debug_message("Removing card " + card.label + " from deck");
		remove_card(card);
	}
}