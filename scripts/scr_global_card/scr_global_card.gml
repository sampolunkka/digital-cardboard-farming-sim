// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

global.library = [];
global.library[0] = card_squire;
global.library[1] = card_cart;
global.library[2] = card_gallant;
global.library[3] = card_knight;
global.library[4] = card_miner;
global.library[5] = card_noviceEngineer;
global.library[6] = card_pegasos;
global.library[7] = card_ronin;
global.library[8] = card_squire;
global.library[9] = card_pegasos;
global.library[10] = card_pegasos;
global.library[11] = card_pegasos;

enum CardFace {
	Up,
	Down,
}

enum CardMovementMode {
	Instant,
	Fast,
	Slow,
}

enum CardType {
	Spell,
	Building,
	Unit,
	Unique
}

function scr_global_card(){

}

function library_getall() {
	return global.library;
}


function card_get_center_x(card) {
		return round(card.anchorX + (card.sprite_width * 0.5));
}

function card_get_center_y(card) {
		return round(card.anchorY + (card.sprite_height * 0.5));
}