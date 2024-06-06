// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more informatio
function playspace_init_deck(playspace, deck) {
	with (playspace) {
		var result_deck = array_shuffle(deck);
		playspace.deck = result_deck;
	}
}