/// @description Insert description here
// You can write your code in this editor
/*
if (top_card.y < start_y) {
	draw_sprite(spr_scroll_arrow, 0, room_width - 10, start_y);
}

if (bottom_card.y > end_y) {
		draw_sprite(spr_scroll_arrow, 1, room_width - 10, room_height - 18);
}
*/

if (bottom_card.y > end_y || top_card.y < start_y) {
	
	// Draw scroll bar
	
	var scroll_bar_x = room_width - 5;
	var scroll_bar_height = end_y - start_y + 32;
	
	draw_sprite(spr_scroll_bar, 0, scroll_bar_x, start_y);
	draw_sprite_stretched(spr_scroll_bar, 1, scroll_bar_x, start_y + 8, sprite_get_width(spr_scroll_bar), scroll_bar_height - 8);
	draw_sprite(spr_scroll_bar, 2, scroll_bar_x, start_y + scroll_bar_height);
	
	// Draw scroll bar pip
	var card_rows = ceil(array_length(collection)/3);
	var collection_height = card_rows * space_y - space_y;
	
	var bottom_card_max_y = collection_height + start_y;
	
	var max_distance_to_scroll = bottom_card_max_y - end_y;
	var distance_to_scroll = bottom_card.y - end_y;
	
	var scroll_percent = 1 - distance_to_scroll/ max_distance_to_scroll;
	
	if (distance_to_scroll > -1) {
	
		var scroll_pip_y = round(start_y + scroll_bar_height * scroll_percent);
		draw_sprite(spr_scroll_bar, 3, scroll_bar_x, scroll_pip_y);
	
	}
	
	if (global.debugEnabled) {
		draw_text(100, 40, card_rows);
		draw_text(100, 60, string(bottom_card.y) + "/" + string(bottom_card_max_y));
		draw_text(100, 80, collection_height);
		draw_text(100, 100, string(distance_to_scroll) + "/" + string(max_distance_to_scroll));
		draw_text(100, 120, scroll_percent);
	}
	
	draw_set_color(c_black);
	//draw_rectangle(start_x, 2, room_width - 2, space_y + 4, false);
}

draw_sprite(spr_collection_top_overlay, 0, room_width, 0);
draw_set_alpha(0.66);
draw_sprite(spr_collection_top_overlay, 1, room_width, 0);
draw_set_alpha(0.33);
draw_sprite(spr_collection_top_overlay, 2, room_width, 0);

draw_set_alpha(1);
draw_set_font(fnt_title);
draw_set_color(c_white);
var collection_text = "C o l l e c t i o n";
draw_text_shadow(room_width/2 + 32, 24, collection_text);

draw_reset();