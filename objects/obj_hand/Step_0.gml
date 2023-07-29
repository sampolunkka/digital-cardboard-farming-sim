/// @description Insert description here
// You can write your code in this editor

for(var i = 0; i < array_length(cards); i++) {
	var card = cards[i];
	if(card.highlighted == true) {
		card.depth = -1000;
		if(card.yOffset <= card.highlightMovementDistance) {
			card.yOffset++;
		}
	} else {
		card.yOffset = 0;
		card.x = card.baseX;
		card.y = card.baseY;
		card.depth = card.baseDepth-i;
	}
}