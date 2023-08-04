/// @description Insert description here
// You can write your code in this editor
x = mouse_x;
y = mouse_y;

if (!isEmpty()) {
	card = cards[0];
	card.anchorX = round(x - card.sprite_width * 0.5);
	card.anchorY = round(y - card.sprite_height * 0.5);
}