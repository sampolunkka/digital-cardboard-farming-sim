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
	//show_message("Player (origin): " + string(origin.id));
	addAction(instance_create_layer(0,0,0,obj_drawAction), origin, targets);
	addAction(instance_create_layer(0,0,0,obj_drawAction), origin, targets);
	addAction(instance_create_layer(0,0,0,obj_drawAction), origin, targets);
	addAction(instance_create_layer(0,0,0,obj_drawAction), origin, targets);
	addAction(instance_create_layer(0,0,0,obj_drawAction), origin, targets);
}

init();
onPhaseBegin();