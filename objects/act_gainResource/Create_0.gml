/// @description Insert description here
// You can write your code in this editor
event_inherited();
function trigger() {
	for(var i = 0; i<array_length(targets); i++) {
		targets[i].addResourceFull();
	}
}