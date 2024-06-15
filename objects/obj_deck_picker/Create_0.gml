/// @description Insert description here
// You can write your code in this editor

image_speed = 0;

// Init deck picker
decks = decks_get_all();

var deck_space = 8 + sprite_get_width(spr_deck);

for (var i = 0; i < array_length(decks); i++) {
	var _deck = instance_create_depth(x + 15 + i * deck_space, y + 3, depth-1, obj_collection_deck);
	_deck.deck_id = i;
}