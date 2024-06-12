/// @description Insert description here
// You can write your code in this editor
fade_alpha-=fade_step;
if (fade_alpha < 0) {
	instance_destroy();
}