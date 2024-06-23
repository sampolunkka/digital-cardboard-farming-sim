// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

global.library = [];
global.library[0] = card_acolyte;
global.library[1] = card_ronin;
global.library[2] = card_flare;
global.library[3] = card_purify;
global.library[4] = card_acolyte;
global.library[5] = card_ronin;
global.library[6] = card_acolyte;
global.library[7] = card_ronin;

enum CardFace {
	Up,
	Down,
}

enum CardMovementMode {
	Instant,
	Fast,
	Slow,
	Slower
}

enum CardType {
	Spell,
	Building,
	Unit,
	Unique
}

function library_getall() {
	var ret = array_create(array_length(global.library));
	for (var i = 0; i < array_length(global.library); i++) {
		ret[i] = i;
	}
	return ret;
}


function card_get_center_x(card) {
		return round(card.anchorX + (card.sprite_width * 0.5));
}

function card_get_center_y(card) {
		return round(card.anchorY + (card.sprite_height * 0.5));
}

function string_debug_card(card) {
	return mask_instance_ref(card) + " " + card.label;
}

function card_get(_id) {
	return global.library[_id];
}

function card_get_id(_object_index) {
	return array_get_index(global.library, _object_index);
}