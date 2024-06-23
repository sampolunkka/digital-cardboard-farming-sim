/// @description Insert description here
// You can write your code in this editor
event_inherited();

label = "Mulligan zone";

max_size = 6;
face = CardFace.Up;

x = room_width/2;
y = room_height/2 - 44;

selected_zone = instance_create_layer(x, y, "Instances", obj_mulligan_selected_zone);
hand = noone;
deck = noone;
turn_controller = noone;
confirm_button = instance_create_layer(x, y - 20, "Instances", obj_confirm_button);

slot_width = 32;

function init_with(_deck, _hand, _turn_controller) {
	
	hand = _hand;
	deck = _deck;
	turn_controller = _turn_controller
	
	// Top row
	var top_row_length = ceil(max_size/2);
	var top_row_width = top_row_length * slot_width;
	for (var i = 0; i < top_row_length; i++) {
		var card = _deck.getTopCard();
		_deck.moveCard(card, self);
		card.set_position(x - top_row_width/2 + slot_width * i, y);
	}
	
	// Bottom row
	var bottom_row_length = floor(max_size/2);
	var bottom_row_width = bottom_row_length * slot_width;
	for (var i = 0; i < bottom_row_length; i++) {
		var card = _deck.getTopCard();
		_deck.moveCard(card, self);
		card.set_position(x - bottom_row_width/2 + slot_width * i, y + 44);
	}
}

function toggle_select(_card) {
	if (selected_zone.hasCard(_card)) {
		selected_zone.moveCard(_card, self);
		show_debug_message("Unselected card " + _card.label)
	} else {
		self.moveCard(_card, selected_zone);
		show_debug_message("Selected card " + _card.label)
	}
}

function confirm() {
	if (selected_zone.isFull()) {
		selected_zone.move_all_cards(hand);
		self.move_all_cards(deck);
		deck.shuffle();
		turn_controller.startTurn();
		instance_destroy(selected_zone);
		instance_destroy(confirm_button);
		instance_destroy();
	}
}