/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function init() {
	var origin = instance_nearest(x,y,obj_opponent);
	var targets = [origin];
	
	origin.refresh();
	
	addAction(instance_create_layer(0,0,"Instances",obj_drawAction), origin, targets);
	addAction(instance_create_layer(0,0,"Instances",act_gainResource), origin, targets);
	origin.getController().board.remove_fatigue();
}

init();
onPhaseBegin();