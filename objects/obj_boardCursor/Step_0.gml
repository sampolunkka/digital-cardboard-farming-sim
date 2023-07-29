/// @description Insert description here
// You can write your code in this editor
x = mouse_x;
y = mouse_y;
if(draggedCard != noone) {
	
	// Make dragged card center to mouse
	draggedCard.x = x + dragOffsetX;
	draggedCard.y = y + dragOffsetY;
	var targetCenterX = round(draggedCard.x + draggedCard.sprite_width * 0.5);
	var targetCenterY = round(draggedCard.y + draggedCard.sprite_height * 0.5);
	if (targetCenterX < x) {
		dragOffsetX += round(distance_to_point(targetCenterX, y) * 0.5);
	} else if (targetCenterX > x) {
		dragOffsetX -= round(distance_to_point(targetCenterX, y) * 0.5);
	}
	if (targetCenterY < y) {
		dragOffsetY += round(distance_to_point(x, targetCenterY) * 0.5);
	} else if (targetCenterY > y) {
		dragOffsetY -= round(distance_to_point(x, targetCenterY) * 0.5);
	}
}

var card = getCardCollisions();
// card hovered
if (card != noone) {
	if (hasDraggedCard() && !card.isOnBoard) {
		state = "dragging";
		hand.movePlaceHolder(card.handIndex);
		return;
	} else if (card.isInHand()) {
		state = "highlighting";
		highlightedCard = card;
		hand.highlightCard(card.handIndex);
		return;
	} else if (card.isOnBoard()) {
		state = "hovering";
		hoveredCard = card;
	}
// no card hovered
} else {
	highlightedCard = noone;
	hoveredCard = noone;
	if (hand != noone) {
		hand.highlightCard(noone);
	}
	state = "free";
}

