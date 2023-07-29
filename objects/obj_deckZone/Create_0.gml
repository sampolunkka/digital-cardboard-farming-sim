/// @description Insert description here
// You can write your code in this editor
event_inherited();

// Override
maxSize = 40;
hidden = false;
face = CardFace.Down;
name = "Deck";

x = 200;
y = 100;

// Override
function refresh() {
	for (var i = 0; i < getSize(); i++) {
		cards[i].baseX = x;
		cards[i].baseY = round(y - i * 0.2);
		cards[i].depth = -i;
	}
}