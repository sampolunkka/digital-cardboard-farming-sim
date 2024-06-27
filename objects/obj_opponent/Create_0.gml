/// @description Insert description here
// You can write your code in this editor
event_inherited();
max_hp = 15;
hp = max_hp;
resource = 0;
resourceMax = resource;
controller = noone;

deck = [6,6,6,6,7,7,7,7,8,8,8,8,0,0,0,0,6,6,6,6];

function init() {
	controller = instance_create_layer(x,y,"Instances",obj_opponentCardController);
	controller.init_with(deck, id);
}

init();