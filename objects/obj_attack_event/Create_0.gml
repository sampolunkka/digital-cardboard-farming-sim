/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

show_debug_message("Attack event created");

path = path_add();
attacker = noone;
defender = noone;
timer = 30;

function trigger() {
	show_debug_message("Attack event started for " + attacker.label);
	var spd = 10;
	path_add_point(path, attacker.x, attacker.y, 100);
	path_add_point(path, defender.x, defender.y, 100);
	var _path = path;
	with (attacker) {
		path_start(_path, spd, path_action_stop, true);
	}
	timer = path_get_length(path)/spd;
	alarm[0] = timer;
}