/// @description Insert description here
// You can write your code in this editor

var zone = collision_point(mouse_x, mouse_y, obj_zone, false, true);

// Move to hand
if (drag.isFull()) {
	var card = drag.getTopCard();
	if (zone == hand) {
		place_in_hand(card);
	
	// Play card on board
	} else if (zone == board && commander.resource >= card.cost) {
		if (card.type == CardType.Unit) {
			play_unit(card);
		} else if (card.type == CardType.Spell) {
			show_debug_message("Attempting to cast spell: " + card.label);
			play_spell(card);
		}
	}

// Disallow selecting cards when card is targeting
} else if (drag.isEmpty() && highlight_zone.isFull()) {
	return;

// Empty drag behaviour
} else if (drag.isEmpty()) {
	var card = getTopmostHoveredCard();
	//show_message("left pressed on card: " + string(card.id));
	if (card != noone && !card.locked) {
		select(card);
	}
}