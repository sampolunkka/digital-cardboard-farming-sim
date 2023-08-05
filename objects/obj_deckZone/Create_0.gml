/// @description Insert description here
// You can write your code in this editor
event_inherited();

// Override
maxSize = 30;
hidden = false;
face = CardFace.Down;
title = "Deck";

x = 200;
y = 100;

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
		if(rand == 0) {
			addCard(instance_create_depth(0,0,0,card_noviceEngineer));
		} else {
			addCard(instance_create_depth(0,0,0,card_miner));
		}
		/*
		var ctitle;
		var rand = irandom_range(0, 4);
		switch (rand) {
			case 0: ctitle = "Forest"; break;
			case 1: ctitle = "Plains"; break;
			case 2: ctitle = "Cabin"; break;
			case 3: ctitle = "River"; break;
			case 4: ctitle = "Farm"; break;
		}
		cards[i].title = ctitle;
		*/
		cards[i].setPosition(x, round(y - i * 0.2));
		cards[i].setDepth(-i);
	}
	//show_message("Deck created!");
}

init();
shuffle();
refresh();