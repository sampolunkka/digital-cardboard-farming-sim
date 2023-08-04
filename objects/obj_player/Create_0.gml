/// @description Insert description here
// You can write your code in this editor
controller = noone;

function init() {
	controller = instance_create_depth(0,0,0,obj_playerCardController);
}

function draw() {
	controller.draw();
}

function getController() {
	return controller;
}

init();