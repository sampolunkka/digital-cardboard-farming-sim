/// @description Insert description here
// You can write your code in this editor
decks = decks_get_all();
active_deck = noone;
fade_out_alpha = 0;
fade_out_increment = 0.005;
fade_out = false;
destination = Level1_1;

var deck_space = 32;

for (var i = 0; i < array_length(decks); i++) {
	var _deck = instance_create_layer(x + deck_space * i, y, "Instances", obj_collection_deck);
	_deck.init_with(i);
}

var cancel_button = instance_create_layer(4, y, "Instances", obj_deck_cancel_button);
cancel_button.text = "Withdraw";

function display_cards() {
	
	for (var i = 0; i < instance_number(obj_battleCard); i++) {
		instance_destroy(obj_battleCard);
	}
	
	var card_space = 30;
	
	// Build 2 rows
	for (var i = 0; i < 8; i++) {
		// First row
		var _card_id = active_deck.cards[i];
		instance_create_depth(card_space * i, y + 40, depth - i, card_get(_card_id));
		
		// Second row
		if (i < 7) {
			_card_id = active_deck.cards[i+7];
			instance_create_depth(15 + card_space * i, y + 90, depth - i - 7, card_get(_card_id));
		}
	}
	
}