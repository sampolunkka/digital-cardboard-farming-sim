/// @description Insert description here
// You can write your code in this editor
event_inherited();
max_hp = 15;
hp = max_hp;
resource = 0;
resourceMax = resource;
controller = noone;

function init() {
	controller = instance_create_depth(x,y,0,obj_opponentCardController);
}

init();