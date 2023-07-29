/// @description Insert description here
// You can write your code in this editor
var next = collision_point(x, y, obj_next, false, true);
if (next != noone && draggedCard == noone) {
	next.triggerClick();
}