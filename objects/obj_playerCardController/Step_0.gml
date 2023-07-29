/// @description Insert description here
// You can write your code in this editor
if (drag.isFull()) {
	if (collision_point(mouse_x, mouse_y, hand, false, true)) {
		createPlaceholderController(hand);
	} else if (collision_point(mouse_x, mouse_y, board, false, true)) {
		createPlaceholderController(board);
	}
}