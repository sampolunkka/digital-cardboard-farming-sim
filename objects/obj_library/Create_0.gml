/// @description Insert description here
// You can write your code in this editor
var library = library_getall();
collection = array_create();

start_x = 124;
start_y = 40;
space_x = 32;
space_y = 48;

end_y = 112;

scroll_speed = 8;

// Init collection
var card_index = 0;
for (var i = 0; i < ceil(array_length(library)/3); i++) {
	for (var j = 0; j < 3; j++) {
		if (card_index >= array_length(library)) {
			break;
		}
		var card = library[card_index];
		var card_instance = instance_create_layer(start_x + 1 * j * space_x, start_y + 1 * i * space_y, "Instances", card);
		card_instance.setFace(CardFace.Up);
		card_instance.depth = 100 - card_index;
		card_index++;
		array_push(collection, card_instance);
	}
}

top_card = array_first(collection);
bottom_card = array_last(collection);

function activate_travel_delayed(_frames) {
	alarm[0] = frames;
}