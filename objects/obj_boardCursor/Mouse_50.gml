/// @description Insert description here
// You can write your code in this editor

if(!hasDraggedCard() && hasHighlightedCard()) {
	var target = highlightedCard;
	if (target.isOnBoard()) {
		return;
	}
	if (dragOffsetX == 0) {
		dragOffsetX = target.x - mouse_x;
		dragOffsetY = target.y - mouse_y;
	}
	draggedCard = target;
	hand.dragCard(target);
}