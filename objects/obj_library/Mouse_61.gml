
if (mouse_x < room_width/2) {
	return;
}

if (bottom_card.y > end_y) {
	for (var i = 0; i < array_length(collection); i++) {
		collection[i].move_y(-scroll_speed);
	}
}
