/// @description Insert description here
// You can write your code in this editor
event_inherited();

// Override
hidden = false;
face = CardFace.Up;
label = "Board";
maxSize = 4;
movementMode = CardMovementMode.Slow;
cards = [];
destroy_cards = [];
mirrored = false;

image_xscale = 6;
image_yscale = 2;
depth = 20;
x = 0;
y = 66;


slotWidth = 20;

// Override
function onInsert(card) {
	card.onPlay();
}

// Override
function refresh() {
	var k = mirrored ? -1 : 1;
	var temp = cards;
	var area = slotWidth * getSize();
	var slot_height = 10;
	var ax = x + (sprite_width / 2 ) - (array_length(cards) * slotWidth/2 * k);
	var ay = y + (sprite_height / 2) + (array_length(cards) * slot_height/2) - 4;
	
	for (var i = 0; i < getSize(); i++) {
		temp[i].setPosition(ax + (i * slotWidth * k), ay - i * slot_height);
		temp[i].image_xscale = mirrored ? -1 : 1;
		if (temp[i].hp <= 0) {
			array_push(destroy_cards, temp[i]);
			temp[i].destroy();
		}
	}
	
	if (array_length(destroy_cards) > 0) {
		alarm[0] = 30;
	}
	cards = temp;
}