/// @description Insert description here
// You can write your code in this editor
event_inherited();
x = room_height/2;
y = -20;
max_size = 8;
slotWidth = 16;

// Override
function refresh() {
	var temp = cards;
	var area = slotWidth * getSize();
	var ax = room_width/2 - 10 - (array_length(cards) * slotWidth/2);
	var ay = y;
	show_debug_message(cards);
	for (var i = 0; i < getSize(); i++) {
		temp[i].set_position(ax + (i * slotWidth), ay);
	}
	cards = temp;
}