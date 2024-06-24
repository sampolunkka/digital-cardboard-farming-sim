/// @description Insert description here
// You can write your code in this editor
for (var i = 0; i < array_length(fading_sounds); i++) {
	audio_stop_sound(fading_sounds[i]);
}

fading_sounds = array_create();