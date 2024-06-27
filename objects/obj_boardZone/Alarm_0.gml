/// @description Remove destroyed cards
// You can write your code in this editor

var temp = cards;
for (var i=0; i<array_length(destroyed_cards); i++) {
	for (var j=0; j<array_length(temp); j++) {
		if (temp[j] == destroyed_cards[i]) {
			array_delete(temp, j, 1);
		}
	}	
}

cards = temp;
destroyed_cards = [];
refresh();