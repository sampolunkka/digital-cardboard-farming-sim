/// @description Insert description here
// You can write your code in this editor
for (var i = 0; i < array_length(card_instances); i++) {
	instance_destroy(card_instances[i]);
}
instance_destroy(obj_deck_save_button);
instance_destroy(obj_deck_cancel_button);