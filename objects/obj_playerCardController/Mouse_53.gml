/// @description Insert description here
// You can write your code in this editor
if (drag.isEmpty()) {
	var card = getTopmostHoveredCard();
	//show_message("left pressed on card: " + string(card.id));
	if (card != noone) {
		select(card);
	}
} else {
	place();
}