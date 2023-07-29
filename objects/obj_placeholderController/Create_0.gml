/// @description Insert description here
// You can write your code in this editor
zone = noone;
index = 0;
placeholder = noone;

function createPlaceholder() {
	index = zone.getIndexAtX(mouse_x);
	placeholder = instance_create_depth(
		mouse_x,
		mouse_y,
		0,
		obj_placeholderCard
	);
	zone.insertCard(placeholder, index);
}