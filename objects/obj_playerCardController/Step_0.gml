/// @description Insert description here
// You can write your code in this editor

// Control dragging
if (drag.isFull()) {
	if (collision_point(mouse_x, mouse_y, hand, false, true)) {
		createPlaceholderController(hand);
	} else if (collision_point(mouse_x, mouse_y, board, false, true)) {
		if (drag.getTopCard().type == CardType.Unit) {
			createPlaceholderController(board);
		}
	}

// Hand hover behaviour
} else {
	drag_hand_index = -1;
	var card = getHoveredCardInZone(hand);
	if (card != noone) {
		card.hover();
		if (!instance_exists(obj_cardInfoController)) {
			var infoControl = instance_create_depth(0,0,0,obj_cardInfoController);
			infoControl.init(card);
		} 
	} 
	// TODO: should we make hover for battlers also?
}