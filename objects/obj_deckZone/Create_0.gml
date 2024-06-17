// @description Insert description here
// You can write your code in this editor
event_inherited();
randomize();
// Override
maxSize = 30;
hidden = false;
face = CardFace.Down;
label = "Deck";

x = 210;
y = 118;

// Override
function refresh() {
	for (var i = 0; i < getSize(); i++) {
		cards[i].anchorX = x;
		cards[i].anchorY = round(y - i * 0.2);
		cards[i].depth = -i;
	}
}

function shuffle() {
	array_shuffle(cards);
}

function init() {
	for (var i=0; i<maxSize; i++) {
		var rand = irandom_range(0,1);
		switch (rand) {
			case 0: addCard(instance_create_depth(0,0,0,card_acolyte)) break;
			case 1: addCard(instance_create_depth(0,0,0,card_acolyte)) break;
			default: addCard(instance_create_depth(0,0,0,card_squire)) break;
		}
		/*
		var clabel;
		var rand = irandom_range(0, 4);
		switch (rand) {
			case 0: clabel = "Forest"; break;
			case 1: clabel = "Plains"; break;
			case 2: clabel = "Cabin"; break;
			case 3: clabel = "River"; break;
			case 4: clabel = "Farm"; break;
		}
		cards[i].label = clabel;
		*/
		cards[i].setPosition(x, round(y - i * 0.2));
		cards[i].setDepth(-i);
	}
	//show_message("Deck created!");
}

init();
shuffle();
refresh();