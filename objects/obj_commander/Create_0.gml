/// @description Insert description here
// You can write your code in this editor

// STATS
resource = 0;
resourceMax = resource;
resource_cap = 10;
max_hp = 15;
hp = max_hp;
attack = 0;
locked = false;

function draw() {
	controller.draw();
}

function drawMultiple(times) {
	for (var i = 0; i < times; i++) {
		draw();
	}
}

function get_controller() {
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

function add_resource_full() {
	resourceMax++;
	resource++;
}

function addResourceEmpty() {
	resourceMax++;
}

function on_damage(_damage) {
	hp-=_damage;
}

function deal_damage(_damage) {
	on_damage(_damage);
}

function heal_damage(_heal) {
	hp = min(max_hp, hp + _heal);
}

function after_damage() {
}

function refresh() {
	resource = resourceMax;
}