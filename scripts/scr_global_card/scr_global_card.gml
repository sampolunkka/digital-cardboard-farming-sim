// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

global.phantasmagoria
= [
	card_squire,
	card_ronin,
	card_gallant
	
];

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

function phantasmagoria_getall() {
	return global.phantasmagoria;
}


function card_get_center_x(card) {
		return round(card.anchorX + (card.sprite_width * 0.5));
}

function card_get_center_y(card) {
		return round(card.anchorY + (card.sprite_height * 0.5));
}