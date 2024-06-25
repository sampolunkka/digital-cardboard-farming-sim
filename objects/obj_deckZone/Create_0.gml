// @description Insert description here
// You can write your code in this editor
event_inherited();
randomize();
// Override
max_size = 100;
hidden = false;
face = CardFace.Down;
label = "Deck";
shuffling = false;
shuffle_timer = 0;
shuffle_timer_max = 30;

// Override
function refresh() {
	for (var i = 0; i < getSize(); i++) {
		cards[i].anchorX = x;
		cards[i].anchorY = round(y - i * 0.2);
		cards[i].depth = -i;
		cards[i].face = CardFace.Down;
	}
}

function shuffle() {
	cards = array_shuffle(cards);
	shuffle_timer = 20;
	shuffling = true;
	audio_play_sound(snd_shuffle, 1, false);
}

function init_with(_card_ids) {
	show_debug_message("Init deck cards with card ids: " + string(_card_ids));
		
	for (var i = 0; i < array_length(_card_ids); i++) {
		var _card_object = card_get(_card_ids[i]);
		addCard(instance_create_layer(0, 0, "Board", _card_object));
		cards[i].set_position(x, round(y - i * 0.2));
		layer_add_instance(layer, cards[i]);
		cards[i].set_depth(depth-i);
		show_debug_message("Added to deck:" + cards[i].label);
	}
	cards = array_shuffle(cards);
}

function on_add(_card) {
	_card.face = CardFace.Down;
}

function on_insert(_card) {
	_card.face = CardFace.Down;
}