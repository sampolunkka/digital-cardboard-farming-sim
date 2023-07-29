/// @description Swap
// You can write your code in this editor
var card = getTopmostHoveredCard();
if (drag.isFull() && card != noone && hand.hasCard(card) != noone) {
	hand.swapCard(card, drag.getCard(), drag);
}
