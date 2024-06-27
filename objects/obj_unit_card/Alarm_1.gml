/// @description Insert description here
// Move to grave
if (audio_is_playing(on_death_sound)) {
	audio_stop_sound(on_death_sound);
}
audio_play_sound(on_death_sound, 0, false);

var controller = instance_nearest(x, y, owner).controller;
controller.board.moveCard(id, controller.grave);