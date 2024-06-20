/// @description Insert description here
// You can write your code in this editor
event_inherited();

max_size = 6;
face = CardFace.Up;

selected_zone = instance_create_layer(x, y, "Instances", obj_mulligan_selected_zone);
hand = noone;
deck = noone;
confirm_button = instance_create_layer(x, -20, "Instances", obj_confirm_button);


slot_width = 32;

x = room_width/2;
y = room_height/2 - 44;

function init_with(_deck, _hand) {
	
	hand = _hand;
	deck = _deck;
	
	// Top row
	var top_row_length = ceil(max_size/2);
	var top_row_width = top_row_length * slot_width;
	for (var i = 0; i < top_row_length; i++) {
		var card = _deck.getTopCard();
		_deck.moveCard(card, self);
		card.setPosition(x - top_row_width/2 + slot_width * i, y);
	}
	
	// Bottom row
	var bottom_row_length = floor(max_size/2);
	var bottom_row_width = bottom_row_length * slot_width;
	for (var i = 0; i < bottom_row_length; i++) {
		var card = _deck.getTopCard();
		_deck.moveCard(card, self);
		card.setPosition(x - bottom_row_width/2 + slot_width * i, y + 44);
	}
}

function toggle_select(_card) {
	if (selected_zone.hasCard(_card)) {
		selected_zone.moveCard(_card, self);
	} else {
		self.moveCard(_card, selected_zone);
	}
}

function confirm() {
	if (selected_zone.isFull()) {
		selected_zone.move_all_cards(hand);
		instance_destroy(selected_zone);
		instance_destroy(confirm_button);
		instance_destroy();
	}
}