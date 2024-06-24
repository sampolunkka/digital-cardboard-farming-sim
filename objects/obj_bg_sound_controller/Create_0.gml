/// @description Insert description here
// You can write your code in this editor

bgm = noone;
bgs = noone;

fading_sounds = array_create();
fade_time = 1000;

// TODO: fix bug

function switch_tracks(_bgm, _bgs) {
	if (bgm == _bgm && bgs == _bgs) {
		return;
	}
	
	if (bgm != noone) {
		audio_sound_gain(bgm, 0, fade_time);
		array_push(fading_sounds, bgm);
		bgm = noone;
	}
	
	if (bgs != noone) {
		audio_sound_gain(bgm, 0, fade_time);
		array_push(fading_sounds, bgs);
		bgs = noone;
	}
	
	alarm[0] = 60/1000 * fade_time;
	
	if (_bgm != undefined) {
		audio_play_sound(_bgm, 0, true, 1);
		audio_sound_gain(_bgm, 1, fade_time);
		bgm = _bgm;
	}
	
	if (_bgs != undefined) {
		audio_play_sound(_bgs, 0, true, 1);
		audio_sound_gain(_bgs, 1, fade_time);
		bgs = _bgs;
	}
}

function sound_fade_out(_sound) {
	audio_sound_gain(_sound, 0, fade_time);
	array_push(fading_sounds, _sound);
	alarm[0] = 60/1000 * fade_time;
	show_debug_message("Fade out sounds: " + string(fading_sounds));
}