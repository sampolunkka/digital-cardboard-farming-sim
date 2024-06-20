/// @description Insert description here
// You can write your code in this editor
if (!instance_exists(obj_deck_editor)) {
	var _deck = collision_point(mouse_x, mouse_y, obj_collection_deck, false, true)
	if (_deck != noone && !instance_exists(obj_deck_editor)) {
		var deck_editor = instance_create_layer(0, 0, "Instances", obj_deck_editor);
		deck_editor.init_with(_deck, self);
	}
}