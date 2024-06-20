/// @description Insert description here
// You can write your code in this editor

var _card = collision_point(mouse_x, mouse_y, obj_battleCard, false, true)
var _confirm = collision_point(mouse_x, mouse_y, obj_confirm_button, false, true);

if (_card != noone) {
	toggle_select(_card);
} else if (_confirm != noone) {
	confirm();
}