/// @description Insert description here
// You can write your code in this editor
start_x = 4;
start_y = 40;
space_x = 32;
space_y = 48;

end_y = 112;

offset_y = 0;

scroll_speed = 8;
top_card = noone;
bottom_card = noone;

cards_list = array_create();
card_instances = array_create();

max_size = 15;
deck_id = 1;

save_button = noone;
deck_picker = noone;

underlay_sprite = spr_deck_editor_underlay;

// Init collection
function init_with(_deck, _deck_picker) {
	deck_picker = _deck_picker;
	array_copy(cards_list, 0, _deck.cards, 0, array_length(_deck.cards));
	deck_id = _deck.deck_id;
	
	
	var card_index = 0;
	for (var i = 0; i < ceil(array_length(cards_list)/3); i++) {
		for (var j = 0; j < 3; j++) {
			if (card_index >= array_length(cards_list)) {
				break;
			}
			var card_id = cards_list[card_index];
			var card_instance = instance_create_layer(start_x + 1 * j * space_x, start_y + offset_y + 1 * i * space_y, "Instances", card_get(card_id));
			card_instance.set_face(CardFace.Up);
			card_instance.set_depth(depth-1);
			card_index++;
			array_push(card_instances, card_instance);
		}
	}
	top_card = array_first(card_instances);
	bottom_card = array_last(card_instances);
	
	// Create deck save button
	save_button = instance_create_layer(x + 26, y + 26, "Buttons", obj_deck_save_button);
	save_button = instance_create_layer(x + 60, y + 26, "Buttons", obj_deck_cancel_button);
	
	// Deactivate room navigation and deck picker
	instance_deactivate_object(obj_entrance);
}

function update() {
	var card_index = 0;
	for (var i = 0; i < ceil(array_length(card_instances)/3); i++) {
		for (var j = 0; j < 3; j++) {
			if (card_index >= array_length(card_instances)) {
				break;
			}
			var card = card_instances[card_index];
			card.depth = depth - card_index;
			card.set_position(start_x + 1 * j * space_x, start_y + offset_y + 1 * i * space_y);
			card_index++;
		}
	}
	top_card = array_first(card_instances);
	bottom_card = array_last(card_instances);
}

function add_card(_card) {
	var card_id = card_get_id(_card.object_index);
	array_push(cards_list, card_id);
	
	var card_instance = instance_create_depth(_card.x, _card.y, depth - 1 - array_length(card_instances), _card.object_index);
	card_instance.face = CardFace.Up;
	array_push(card_instances, card_instance);
	show_debug_message("cards_list: " + string(cards_list));
	update();
}

function remove_card(_card) {
	var index = array_get_index(card_instances, _card);
	if (index >= 0) {
		array_delete(cards_list, index, 1);
		show_debug_message("Cards list: " + string(cards_list));
		instance_destroy(card_instances[index]);
		array_delete(card_instances, index, 1);
		update();
	}
}

function is_full() {
	return array_length(cards_list) >= max_size;
}

// Need delayed destroy since travel can accidentally activate on cancel
function destroy_delayed() {
	alarm[0] = 1;
}