/// @description Insert description here
// You can write your code in this editor
var target = getOpponentCard();
//show_message("Target id: " + string(target.id));
if (target != noone) {
	attackCard(target);
	instance_destroy();
}