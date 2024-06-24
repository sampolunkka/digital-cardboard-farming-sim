/// @description Insert description here
// You can write your code in this editor

bgm = noone;
bgs = noone;

fading_sounds = array_create();
fade_time = 500;

function switch_tracks(_bgm, _bgs) {
	
	show_debug_message("Switch tracks");
	if (bgm != noone) {
		sound_fade_out(bgm);
	}
	
	if (bgs != noone) {
		sound_fade_out(bgs);
	}
	
	if (_bgm != undefined) {
		audio_play_sound(_bgm, 1, true, 0);
		audio_sound_gain(_bgm, 1, 500);
		bgm = _bgm;
	}
	
	if (_bgs != undefined) {
		audio_play_sound(_bgs, 1, true, 0);
		audio_sound_gain(_bgs, 1, 500);
		bgs = _bgs;
	}
}

function sound_fade_out(_sound) {
	audio_sound_gain(_sound, 0, 500);
	array_push(fading_sounds, _sound);
	alarm[0] = 60/1000 * fade_time;
}