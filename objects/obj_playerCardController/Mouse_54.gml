/// @description Insert description here
// You can write your code in this editor
if (!highlight_zone.isEmpty()) {
	highlight_zone.moveCard(highlight_zone.getTopCard(), drag);
} else if (!drag.isEmpty()) {
	drag.moveCard(drag.getTopCard(), hand);
	instance_destroy(obj_placeholderController);
}