/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
hover = false;

cards = array_create(0, noone);
effects = array_create(0, noone);

stackHeight = sprite_height;
originalScaleY = sprite_height;

food = 0;
skins = 0;
wood = 0;

slotCardPlaceX = x + sprite_width * 0.5;

function placeCard(_card) {
	var len = array_length(cards);
	array_push(cards, _card);
	_card.x = slotCardPlaceX - _card.sprite_width * 0.5;
	_card.y = y + 2 + 8 * len;
	_card.depth = depth - 1 - len;
	_card.state = "board";
	_card.place = self;
	_card.yOffset = 0;
	array_push(effects, _card.getEffect());
	stackHeight = max(stackHeight, _card.sprite_height * 0.8 + _card.y - y);
	image_yscale = 1 / originalScaleY * stackHeight;
}

function triggerEffects() {
	for (var i = 0; i < array_length(effects); i++) {
		var effect = effects[i];
		effect.applyEffect(self);
	}
	hud.food += food;
	hud.skins += skins;
	hud.wood += wood;
	resetResourceCounters();
}

function resetResourceCounters() {
	food = 0;
	skins = 0;
	wood = 0;
}