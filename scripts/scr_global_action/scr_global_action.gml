// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function scr_global_action(){

}

function action_create(action, origin, targetsArray) {
	var instance = instance_create_depth(0,0,0,action);
	instance.init(origin, targetsArray);
	return instance;
}