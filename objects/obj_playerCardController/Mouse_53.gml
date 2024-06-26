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
	if (card != noone) {
		select(card);
	}
}

/*
if (drag.isEmpty()) {
	var card = getTopmostHoveredCard();
	//show_message("left pressed on card: " + string(card.id));
	if (card != noone) {
		select(card);
	}
} else {
	var card = drag.getTopCard();
	if (card.type == CardType.Spell) {
		var zone = collision_point(mouse_x, mouse_y, obj_zone, false, true);
		if (zone != hand) {
			if (card.targeted) {
				if (player.resource >= card.cost) {
					drag.moveCard(card, highlight_zone);
					var trgt_con = instance_create_depth(card_get_center_x(card), card_get_center_y(card) ,0,obj_targeting_controller);
					trgt_con.init(card, card.target_type, hand, grave);
				}
			} else {
				if (player.resource >= card.cost) {
					player.payForCard(card);
					card.on_cast(noone, hand, grave);
				}
			} 
		} else {
			place();
		}
	} else if (card.type == CardType.Unit) {
		place();
	}
}*/