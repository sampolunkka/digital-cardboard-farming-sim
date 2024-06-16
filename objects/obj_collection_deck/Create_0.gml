/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
deck_id = 0;
open = false;
cards = array_create();

function init_with(_id) {
	deck_id = _id;
	cards = deck_get(_id);
}