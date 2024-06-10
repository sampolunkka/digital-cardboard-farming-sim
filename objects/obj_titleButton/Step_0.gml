/// @description Insert description here
// You can write your code in this editor
if (collision_point(mouse_x, mouse_y, self, false, false)) {
	hovered = true;
	if(mouse_check_button(mb_left)) {
		room_goto(destination);
	}
} else {
	hovered = false;
}