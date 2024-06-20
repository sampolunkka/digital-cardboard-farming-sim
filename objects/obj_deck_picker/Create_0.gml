/// @description Insert description here
// You can write your code in this editor

image_speed = 0;

decks = array_create();

function init() {
	
	var decks_count = instance_number(obj_collection_deck);
	for (var i = 0; i < decks_count; i++) {
		var deck_instance = instance_find(obj_collection_deck, i);
		instance_destroy(deck_instance);
	}
	
	// Init deck picker
	var card_ids = decks_get_all();

	var deck_space = 4 + sprite_get_height(spr_deck);

	for (var i = 0; i < array_length(card_ids); i++) {
		var _deck = instance_create_depth(x, y + i * deck_space, depth-1, obj_collection_deck);
		_deck.init_with(i);
		decks[i] = _deck;
	}
}

function update() {
	for (var i = 0; i < array_length(decks); i++) {
		decks[i].cards = deck_get(i);
	}
}

init();