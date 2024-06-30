/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

show_debug_message("Attack event created");

defender = noone;
attacker = noone;
path = path_add();
timer = 10;

function trigger() {
	show_debug_message("Attack event started for " + attacker.label);
	var distance = point_distance(attacker.x, attacker.y, defender.x, defender.y);
	var spd = 10;
	path_add_point(path, attacker.x, attacker.y, 100);
	path_add_point(path, defender.x, defender.y, 100);
	var _path = path;
	with (attacker) {
		path_start(_path, spd, path_action_stop, true);
	}
	alarm[0] = distance/5;
}