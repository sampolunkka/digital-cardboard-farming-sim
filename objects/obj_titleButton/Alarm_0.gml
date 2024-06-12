/// @description Insert description here
// You can write your code in this editor
screen_fade_alpha += screen_fade_alpha_increment;
if (screen_fade_alpha >= 1) {
	room_goto(destination);
}
alarm[0] = 1;