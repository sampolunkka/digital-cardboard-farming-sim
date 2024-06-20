// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Init decks
global.decks = array_create();
global.decks[0] = array_create();
global.decks[1] = array_create();
global.decks[2] = array_create();

// Active deck
global.active_deck = noone;

function decks_get_all() {
	// Get from file
	ini_open("decks.ini");
	global.decks[0] = json_parse(ini_read_string("deck0", "card_ids", array_create()));
	global.decks[1] = json_parse(ini_read_string("deck1", "card_ids", array_create()));
	global.decks[2] = json_parse(ini_read_string("deck2", "card_ids", array_create()));
	ini_close();
	show_debug_message("Loaded decks from file, " + string(global.decks));
	return global.decks;
}

function deck_save(_id, _cards) {
	var max_decks = array_length(global.decks);
	if (_id > max_decks - 1) {
		show_message("Invalid deck id: " + string(_id) + ", max decks allowed is " + string(max_decks));
		return;
	}
	global.decks[_id] = _cards;
	show_debug_message("Deck" + string(_id) +" saved to memory: " + string(global.decks[_id]));
	
	ini_open("decks.ini");
	ini_write_string("deck" + string(_id) , "card_ids", json_stringify(global.decks[_id]));
	ini_close();
	
}

function deck_get(_id) {
	var max_decks = array_length(global.decks);
	if (_id > max_decks - 1) {
		show_message("Invalid deck id: " + string(_id) + ", max decks allowed is " + string(max_decks));
		return -1;
	}
	return global.decks[_id];
}