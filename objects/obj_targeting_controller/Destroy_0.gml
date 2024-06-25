/// @description Insert description here
// You can write your code in this editor
var highlight_zone = instance_nearest(x, y, obj_highlight_zone);
if (highlight_zone.getTopCard() == targeting_card) {
	highlight_zone.moveCard(targeting_card, grave);
}