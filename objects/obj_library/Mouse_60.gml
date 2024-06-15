
if (array_length(collection) < 1 || mouse_x < room_width/2) {
	return;
}

if (top_card.y < start_y) {
	for (var i = 0; i < array_length(collection); i++) {
		collection[i].move_y(scroll_speed);
	}
}