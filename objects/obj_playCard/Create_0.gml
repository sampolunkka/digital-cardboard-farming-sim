/// @description Insert description here
// You can write your code in this editor
cardtitle = "card";

faceDownSprite = spr_cardBack;
faceUpSprite = spr_card;

face = CardFace.Down;
hidden = true;

anchorX = x;
anchorY = y;

movementSnapDistance = 2;
movementSpeedMultiplier = 0.8;
movementMode = CardMovementMode.Instant;

placeholder = false;

function setFace(face) {
	self.face = face;
}

function setHidden(boolean) {
	hidden = boolean;
}

function setFaceAndHidden(face, hidden) {
	setFace(face);
	setHidden(hidden);
	refresh();
}

function setPosition(tx, ty) {
	anchorX = tx;
	anchorY = ty;
}

function setMovement(mode) {
	movementMode = mode;
	switch (movementMode) {
		case CardMovementMode.Fast: movementSpeedMultiplier = 0.8; break;
		case CardMovementMode.Slow: movementSpeedMultiplier = 0.4; break;
		default: movementSpeedMultiplier = 1; break;
	}
}

function isPlaceholder() {
	return placeholder;
}

function refresh() {
	if (face == CardFace.Down) {
		sprite_index = faceDownSprite;
	} else if (face == CardFace.Up) {
		sprite_index = faceUpSprite;
	}
	
	if (hidden) {
		sprite_index = noone;
	}
}