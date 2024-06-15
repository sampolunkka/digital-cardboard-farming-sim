
if (array_length(card_instances) < 1) {
	return;
}

if (bottom_card.y > end_y || top_card.y < start_y) {
	
	// Draw scroll bar
	
	var scroll_bar_x = x + sprite_width + 2;
	var scroll_bar_height = end_y - start_y + 32;
	
	draw_sprite(spr_scroll_bar, 0, scroll_bar_x, start_y);
	draw_sprite_stretched(spr_scroll_bar, 1, scroll_bar_x, start_y + 8, 8, scroll_bar_height - 8);
	draw_sprite(spr_scroll_bar, 2, scroll_bar_x, start_y + scroll_bar_height);
	
	// Draw scroll bar pip
	var card_rows = ceil(array_length(card_instances)/3);
	var card_instances_height = card_rows * space_y - space_y;
	
	var bottom_card_max_y = card_instances_height + start_y;
	
	var max_distance_to_scroll = bottom_card_max_y - end_y;
	var distance_to_scroll = bottom_card.y - end_y;
	
	var scroll_percent = 1 - distance_to_scroll/ max_distance_to_scroll;
	
	if (distance_to_scroll > -1) {
	
		var scroll_pip_y = round(start_y + scroll_bar_height * scroll_percent);
		draw_sprite(spr_scroll_bar, 3, room_width - 10, scroll_pip_y);
	
	}
	
	if (global.debugEnabled) {
		draw_text(100, 40, card_rows);
		draw_text(100, 60, string(bottom_card.y) + "/" + string(bottom_card_max_y));
		draw_text(100, 80, card_instances_height);
		draw_text(100, 100, string(distance_to_scroll) + "/" + string(max_distance_to_scroll));
		draw_text(100, 120, scroll_percent);
	}
}

draw_reset();