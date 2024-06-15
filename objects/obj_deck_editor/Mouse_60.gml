
if (mouse_x > room_width/2) {
	return;
}

if (top_card.y < start_y) {
	for (var i = 0; i < array_length(card_instances); i++) {
		card_instances[i].move_y(scroll_speed);
	}
		offset_y += scroll_speed;
}