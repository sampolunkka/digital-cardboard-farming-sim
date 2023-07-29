/// @description Insert description here
// You can write your code in this editor


// Card state
state = "hand";

// Card is highligted in hand
highlighted = false;
highlightMovementDistance = 3;
baseDepth = depth;
baseY = y;
baseX = x;
handIndex = 1;
yOffset = 0;
isPlaceholder = true;
effect = noone;
effectText = "efct";
info = "card info";
portrait = spr_farm;
cardName = "Card";
place = noone;
shine = false;
shineAlpha = 0;
hovered = false;

function getState() {
	return state;
}

function getEffect() {
	return effect;
}

function isInHand() {
	return state == "hand";
}

function isOnBoard() {
	return state == "board";
}