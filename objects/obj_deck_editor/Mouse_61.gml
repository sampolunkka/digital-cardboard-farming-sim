
if (mouse_x > room_width/2) {
	return;
}

if (bottom_card.y > end_y) {
	for (var i = 0; i < array_length(card_instances); i++) {
		card_instances[i].move_y(-scroll_speed);
	}
	offset_y -= scroll_speed;
}
