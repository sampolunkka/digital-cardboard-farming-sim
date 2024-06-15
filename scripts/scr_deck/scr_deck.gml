// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Init decks
global.decks = array_create();
global.decks[0] = array_create();
global.decks[1] = array_create();
global.decks[2] = array_create();

function decks_get_all() {
	return global.decks;
}

function deck_save(_id, _cards) {
	var max_decks = array_length(global.decks);
	if (_id < max_decks) {
		show_message("Invalid deck id!");
		return;
	}
	
	array_copy(global.decks[_id], 0, _cards, 0, array_length(_cards));
}

function deck_get(_id) {
	var max_decks = array_length(global.decks);
	if (_id < max_decks) {
		show_message("Invalid deck id!");
		return -1;
	}
	return global.decks[_id];
}