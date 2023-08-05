/// @description Insert description here
// You can write your code in this editor

// Control dragging
if (drag.isFull()) {
	if (collision_point(mouse_x, mouse_y, hand, false, true)) {
		createPlaceholderController(hand);
	} else if (collision_point(mouse_x, mouse_y, board, false, true)) {
		createPlaceholderController(board);
	}

// Hand hover behaviour
} else {
	var card = getHoveredCardInZone(hand);
	if (card != noone) {
		card.hover();
		if (!instance_exists(obj_cardInfoController)) {
			var infoControl = instance_create_depth(0,0,0,obj_cardInfoController);
			infoControl.init(card);
		} 
		/* This is buggy
		else {
			var infoControl = instance_nearest(0,0,obj_cardInfoController);
			if (infoControl.card != card) {
				infoControl.init(card);
			}
		}
		*/
	} 
}