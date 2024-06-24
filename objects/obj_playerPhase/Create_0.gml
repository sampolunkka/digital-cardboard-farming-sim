/// @description Insert description here
//
event_inherited();

delay = 15;

function onPhaseBegin() {
	alarm[0] = delay;
}

function init() {
	var origin = instance_nearest(x,y,obj_player);
	var targets = [origin];
	
	origin.refresh();
	
	addAction(instance_create_layer(0,0,"Instances",obj_drawAction), origin, targets);
	addAction(instance_create_layer(0,0,"Instances",act_gainResource), origin, targets);
	origin.get_controller().board.remove_fatigue();
}

init();
onPhaseBegin();