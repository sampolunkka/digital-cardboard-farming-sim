/// @description Insert description here
// You can write your code in this editor
var _card = collision_point(mouse_x, mouse_y, obj_battleCard, false, true);

if (_card == noone) {
	return;
}

if (instance_exists(obj_deck_editor)) {
	
	if (obj_deck_editor.is_full()) {
		return;
	}
	
	if (array_contains(collection, _card)) {
		var editor = instance_nearest(x, y, obj_deck_editor);
		editor.add_card(_card);
	}
}