/// @description Insert description here
// You can write your code in this editor
if (zone != noone) {
	if (collision_point(mouse_x, mouse_y, zone, false, true)) {
		var ind = zone.getIndexAtX(mouse_x);
		var card = zone.getIndex(ind);
		if (card != noone) {
			if (!card.isPlaceholder) {
				zone.deleteCard(placeholder);
				index = ind;
				placeholder = instance_create_depth(
					card.baseX,
					card.baseY,
					0,
					obj_placeholderCard
				);
				zone.insertCard(placeholder, index);
			}
		}	
	} else {
		zone.deleteCard(placeholder);
		instance_destroy();
	}
}