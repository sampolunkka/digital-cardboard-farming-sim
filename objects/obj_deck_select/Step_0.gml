/// @description Insert description here
// You can write your code in this editor
if (fade_out) {
	fade_out_alpha += fade_out_increment;
	if (fade_out_alpha >= 1) {
		room_goto(destination);
	}
}