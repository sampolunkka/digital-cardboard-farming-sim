// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum CardFace {
	Up,
	Down,
}

enum CardMovementMode {
	Instant,
	Fast,
	Slow,
}

function scr_global_card(){

}

function getCardCenterX(card) {
	return round(card.anchorX + (card.sprite_width * 0.5));
}