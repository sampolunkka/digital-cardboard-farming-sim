/// @description Insert description here
// You can write your code in this editor
big_card_fade_alpha -= 0.1;
big_card_animation_frame++;
animation_alpha +=0.05;
if (instance_exists(card)) {
	x = card.x;
	y = card.y;
}