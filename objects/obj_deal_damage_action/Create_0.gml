/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

damage = 0;

// @Override
function trigger() {
	show_debug_message(targets);
	targets[0].hp -= damage;
}
