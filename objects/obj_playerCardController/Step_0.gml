/// @description Insert description here
// You can write your code in this editor
if (drag.isFull()) {
	if (collision_point(mouse_x, mouse_y, hand, false, true)) {
		hand.createGap();
	}
}