// @description Insert description here
// You can write your code in this editor
event_inherited();
randomize();
// Override
max_size = 30;
hidden = false;
face = CardFace.Down;
label = "Deck";

// Override
function refresh() {
	for (var i = 0; i < getSize(); i++) {
		cards[i].anchorX = x;
		cards[i].anchorY = round(y - i * 0.2);
		cards[i].depth = -i;
	}
}

function shuffle() {
	cards = array_shuffle(cards);
}

function init() {
	show_debug_message("Init deck cards");
	var _card_ids = global.active_deck;
		
	for (var i = 0; i < array_length(_card_ids); i++) {
		var _card_object = card_get(_card_ids[i]);
		addCard(instance_create_depth(0,0,0,_card_object));
		cards[i].set_position(x, round(y - i * 0.2));
		cards[i].set_depth(-i);
		show_debug_message("Added to deck:" + cards[i].label);
	}
	//show_message("Deck created!");
}

init();
shuffle();
refresh();