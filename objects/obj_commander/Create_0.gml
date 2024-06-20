/// @description Insert description here
// You can write your code in this editor
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