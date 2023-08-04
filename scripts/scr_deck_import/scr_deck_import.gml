// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_deck_import(){

}


// TODO: translate strings into cards
// TODO: doesnt work with exxternally created ini files, need to make a deck manager to create ini first and then read it
/*function scr_import_deck(decktitle) {
	
	var sectInfo = "info";
	var keytitle = "title";
	var sectCards= "cards";
	
	var deck = instance_create_depth(0,0,0,obj_deckList);
	
	ini_open("datafiles/" + string(decktitle) + ".ini");
	deck.title = ini_read_string(sectInfo, keytitle, "title");
	//show_message(deck.title);
	
	var cards = array_create(deck.maxSize);
	for (var i=0; i<deck.maxSize; i++) {
		cards[i+1] = ini_read_string(sectCards, i, "empty");
	}
	ini_close();
	
	deck.cards = cards;
	return deck;
}
*/