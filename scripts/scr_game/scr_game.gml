// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function game_save_deck(_deck_id, _card_ids){
	ini_open("decks.ini");
	ini_write_string("deck" + string(_deck_id) , "card_ids", json_stringify(_card_ids));
	ini_close();
}

function game_load_decks() {
	ini_open("decks.ini");
	global.decks[0] = json_parse(ini_read_string("deck0", "card_ids", array_create()));
	global.decks[1] = json_parse(ini_read_string("deck1", "card_ids", array_create()));
	global.decks[2] = json_parse(ini_read_string("deck2", "card_ids", array_create()));
	ini_close();
}