/// @description Insert description here
// You can write your code in this editor
owner = noone;
hp = 3;
number_threshold = 4;
atk = 0;
fade_in_alpha = 0;
fade_out_timer = 30;
fade_out_timer_max = 30;
fade_out_alpha = 0;
offset_y = 200;

function destroy() {
	fade_in_alpha = 0.2;
	alarm[0] = 10;
	alarm[1] = 30;
}