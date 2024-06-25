/// @description Insert description here
// You can write your code in this editor
event_inherited();

// STATS
resource = 0;
resourceMax = resource;
resource_cap = 10;
max_hp = 15;
hp = max_hp;


controller = noone;

function init() {
	controller = instance_create_layer(x, y, "Instances", obj_playerCardController);
	controller.init_with(id);
}

init();