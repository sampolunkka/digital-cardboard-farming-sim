/// @description Insert description here
// You can write your code in this editor

var cursorCollision = collision_rectangle(
	x,
	y,
	x + sprite_width,
	y + sprite_height,
	obj_boardCursor,
	false,
	true
);

if (cursorCollision != noone) {
	image_index = 1;
} else {
	image_index = 0;
}