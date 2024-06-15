/// @description Insert description here
// You can write your code in this editor
if (collision_point(mouse_x, mouse_y, obj_deck_save_button, false, true)) {
	deck_save(deck_id, cards_list);
	destroy_delayed();
} else if (collision_point(mouse_x, mouse_y, obj_deck_cancel_button, false, true)) {
	destroy_delayed();
}