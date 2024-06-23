/// @description Insert description here
// You can write your code in this editor
if (drag.isEmpty()) {
	var card = getTopmostHoveredCard();
	//show_message("left pressed on card: " + string(card.id));
	if (card != noone) {
		select(card);
	}
} else {
	
	//TODO: Check zone
	var card = drag.getTopCard();
	if (card.type == CardType.Spell) {
		
		var zone = collision_point(mouse_x, mouse_y, obj_zone, false, true);
		if (zone != hand) {
			if (card.targeted) {
				drag.moveCard(card, highlight_zone);
				var trgt_con = instance_create_depth(card_get_center_x(card), card_get_center_y(card) ,0,obj_targeting_controller);
				trgt_con.init(card, card.target_type, hand, grave);
			} else {
				card.on_cast(noone, hand, grave);
			} 
		} else {
			place()
		}
	} else if (card.type == CardType.Unit) { 
		place();
	}
}