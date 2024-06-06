// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function zone_is_full(zone) {
	return array_length(zone.cards) >= zone.max_size;
}

function zone_add_card(card, zone, index) {
	if (zone_is_full(zone)) {
		show_debug_message("Cannot add card: " + string_debug_card(card) + " to zone: " + string_debug_zone(zone) + ". Zone is full.");
		return;
	}
	
	var result_cards = zone_cards;
	if (is_array(result_cards)) {
		if (index == undefined) {
			array_push(result_cards, card);
		} else if (index >= zone.max_size || index < 0) {
			show_debug_message("Index " + string(index) + " is out of bounds 0-" + string(zone.max_size-1));
			array_push(result_cards, card);
		} else {
			array_insert(result_cards, index, card);
		}
	} else {
		show_debug_message("Cannot add card " + string_debug_card(card) + " to zone " + string_debug_zone(zone) + ", result_cards is not an array.");
	}
	
	zone.cards = result_cards;
}

function zone_remove_card(card, zone) {
	var index = array_get_index(zone.cards, card);
	if (index < 0) {
		if (is_array(zone.cards)) {
			var result_array = zone.cards;
			array_delete(result_array, index, 1);
			zone.cards = result_array;
		}
	}
}

function string_debug_zone(zone) {
	return mask_instance_ref(zone) + zone.label;
}