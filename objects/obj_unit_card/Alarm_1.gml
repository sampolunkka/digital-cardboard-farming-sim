/// @description Insert description here
// You can write your code in this editor
var zone = collision_point(x, y, obj_zone, false, false);
if (!audio_is_playing(on_death_sound)) {
	audio_play_sound(on_death_sound, 0, false);
}
instance_destroy();