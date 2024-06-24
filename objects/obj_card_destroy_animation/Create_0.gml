/// @description Insert description here
// You can write your code in this editor
big_card_fade_alpha = 2;
animation_alpha = 0;
big_card_animation_frame = 0;
impact_sound = snd_card_destroy_impact;
shatter_sound = snd_card_destroy_shatter;

if (audio_is_playing(impact_sound)) {
	audio_stop_sound(impact_sound);
}
audio_play_sound(impact_sound, 1, false);
alarm[0] = 10;