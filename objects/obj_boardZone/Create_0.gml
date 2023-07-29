/// @description Insert description here
// You can write your code in this editor
event_inherited();

// Override
hidden = false;
face = CardFace.Up;
name = "Board";
maxSize = 4;
movementMode = CardMovementMode.Slow;

image_xscale = 12;
image_yscale = 2;

x = 0;
y = 40;


slotWidth = 32;

// Override
function addCard(card) {
	//show_message("add card on zone: " + name + " and card: " + string(card.id));
	if (array_length(cards) >= maxSize) {
		show_message("Zone is full!");
		return;
	}
	
	card.setFaceAndHidden(face, hidden);
	card.setMovement(movementMode);
	
	// Find index to place card to
	var index = 0;
	//show_message("size: " + string(getSize()));
	for (var i=0; i<getSize(); i++) {
		var cardOnBoard = cards[i];
		//show_message("card center: " + string(getCardCenterX(cardOnBoard)));
		if (mouse_x > getCardCenterX(cardOnBoard)) {
			index++;
		} else {
			break;
		}
	}
	//show_message("attempting to insert into array as index: " + string(index));
	array_insert(cards, index, card);
	refresh();
}

// Override
function refresh() {
	var area = slotWidth * getSize();
	var ax = round(sprite_width * 0.5 - area * 0.5);
	var ay = y;
	
	for (var i = 0; i < getSize(); i++) {
		cards[i].setPosition(ax + i * slotWidth, ay);
	}
}