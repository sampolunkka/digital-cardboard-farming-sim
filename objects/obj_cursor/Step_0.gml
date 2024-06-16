/// @description Insert description here
// You can write your code in this editor
x =  mouse_x;
y =  mouse_y;

if (collision_point(mouse_x, mouse_y, obj_inspectable, false, true)) {
	mode = CursorMode.Inspect;
} else {
	mode = CursorMode.Neutral;
}