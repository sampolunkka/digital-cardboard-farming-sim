/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

origin = noone;
targets = [];

function trigger() {
	for (var i=0; i<array_length(targets); i++) {
		doDraw(targets[i]);
	}
}

function doDraw(player) {
	player.draw();
}

function init(origin, targets) {
	self.origin = origin;
	self.targets = targets
}