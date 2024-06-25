/// @description Insert description here
// You can write your code in this editor

for(var i = 0; i < array_length(cards); i++) {
	var card = cards[i];
	if(card.highlighted == true) {
		card.depth = -100;
		if(card.yOffset <= card.highlightMovementDistance) {
			card.yOffset++;
		}
	} else {
		card.yOffset = 0;
		card.x = card.anchorX;
		card.y = card.anchorY;
		card.depth = card.baseDepth-i;
	}
}