/// @description Insert description here
// You can write your code in this editor
event_inherited();

// Override
hidden = false;
face = CardFace.Up;
title = "Board";
maxSize = 4;
movementMode = CardMovementMode.Slow;

image_xscale = 12;
image_yscale = 2;
depth = 20;
x = 0;
y = 50;


slotWidth = 32;

// Override
function onInsert(card) {
	card.onPlay();
}

// Override
function refresh() {
	var area = slotWidth * getSize();
	var ax = round(sprite_width * 0.5 - area * 0.5);
	var ay = y;
	
	for (var i = 0; i < getSize(); i++) {
		cards[i].setPosition(ax + i * slotWidth, ay);
	}
}