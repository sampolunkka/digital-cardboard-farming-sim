/// @description Insert description here
// You can write your code in this editor
if(hasDraggedCard()) {
	var boardSlot = collision_point(x, y, obj_boardSlot, false, true);
	if (boardSlot != noone) {
		boardSlot.placeCard(draggedCard);
		var temp = draggedCard;
		hand.removePlaceholders();
		init();
	} else {
		hand.returnToPlaceHolder(draggedCard);
		init();
	}
}