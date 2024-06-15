
if (array_length(card_instances) > 0) {
	if (bottom_card.y > end_y || top_card.y < start_y) {
	
		// Draw scroll bar
	
		var scroll_bar_x = x + sprite_width - 10;
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
			draw_sprite(spr_scroll_bar, 3, scroll_bar_x, scroll_pip_y);
	
		}
	
		if (global.debugEnabled) {
			draw_text(0, 40, card_rows);
			draw_text(0, 60, string(bottom_card.y) + "/" + string(bottom_card_max_y));
			draw_text(0, 80, card_instances_height);
			draw_text(0, 100, string(distance_to_scroll) + "/" + string(max_distance_to_scroll));
			draw_text(0, 120, scroll_percent);
		}
	}
} else {
	draw_set_font(fnt_title);
	var no_cards_text = "Empty";
	draw_text_shadow(x + sprite_width/2 - string_width(no_cards_text)/2,
		y + sprite_height/2 - string_height(no_cards_text)/2,
		no_cards_text);
}

// Draw selected deck overlay background
draw_set_font(fnt_title);
draw_set_alpha(1);
draw_sprite(spr_selected_deck_overlay, 0, x, y);
draw_set_alpha(0.66);
draw_sprite(spr_selected_deck_overlay, 1, x, y);
draw_set_alpha(0.33);
draw_sprite(spr_selected_deck_overlay, 2, x, y);

// Draw deck sprite
draw_set_alpha(1);
draw_sprite(spr_deck, 0, x + 2, y + 2);

// Draw deck id (name)
var deck_text = "D e c k  " + string(deck_id + 1);
var deck_text_height = string_height(deck_text);
draw_text_shadow(x + sprite_get_width(spr_deck) + 4, y + 3, deck_text);

// Draw deck size
draw_set_font(global.labelFont);
draw_text_shadow(x + sprite_get_width(spr_deck) + 5, y + 1 + deck_text_height, "Cards: " + string(array_length(cards_list)) + "/" + string(max_size));

draw_reset();