/// @description Insert description here
// You can write your code in this editor
title = "";
cards = [];
maxSize = 30;

// This is for development
function getDecklistCards() {
	var instances = array_create(maxSize);
	for (var i=0; i<array_length(cards); i++) {
		instances[i] = instance_create_depth(0,0,0,obj_playCard);
		var ctitle;
		var rand = irandom_range(0, 4);
		switch (rand) {
			case 0: ctitle = "Forest"; break;
			case 1: ctitle = "Plains"; break;
			case 2: ctitle = "Cabin"; break;
			case 3: ctitle = "River"; break;
			case 4: ctitle = "Farm"; break;
		}
		instances[i].cardtitle = ctitle;
	}
	return instances;
}