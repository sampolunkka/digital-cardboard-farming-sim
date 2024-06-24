/// @description Shatter sound
// You can write your code in this editor
if (audio_is_playing(shatter_sound)) {
	audio_stop_sound(shatter_sound);
}
audio_play_sound(shatter_sound, 1, false);