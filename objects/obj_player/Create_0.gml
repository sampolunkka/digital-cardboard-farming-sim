/// @description Insert description here
// You can write your code in this editor

// STATS
resource = 1;
resourceMax = 1;
hp = 30;


controller = noone;

function init() {
	controller = instance_create_depth(0,0,0,obj_playerCardController);
	drawMultiple(5);
}

function draw() {
	controller.draw();
}

function drawMultiple(times) {
	for (var i = 0; i < times; i++) {
		draw();
	}
}

function getController() {
	return controller;
}

function payResource(value) {
	if (value <= resource) {
		resource -= value;
		return true;
	}
	return false;
}

function payForCard(card) {
	return payResource(card.cost);
}

function addResourceFull() {
	resourceMax++;
	resource++;
}

function addResourceEmpty() {
	resourceMax++;
}

function refresh() {
	resource = resourceMax;
}

init();