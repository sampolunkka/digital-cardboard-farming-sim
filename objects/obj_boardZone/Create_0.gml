/// @description Insert description here
// You can write your code in this editor
event_inherited();

// Override
hidden = false;
face = CardFace.Up;
label = "Board";
max_size = 4;
movementMode = CardMovementMode.Slow;
cards = [];
destroy_cards = [];
owner = noone;

slotWidth = 34;

// Override
function on_insert(card) {
	card.on_play();
	card.interaction = Interaction.None;
	card.setMovement(movementMode);
	card.set_face(CardFace.Up);
	card.on_board = true;
	card.owner = owner;
}

function on_add(card) {
	on_insert(card);
}

// Override
function refresh() {
	var temp = cards;
	var area = slotWidth * getSize();
	var ax = x + (sprite_width / 2 ) - (array_length(cards) * slotWidth/2);
	var ay = y;
	
	for (var i = 0; i < getSize(); i++) {
		if (instance_exists(temp[i])) {
			temp[i].set_position(ax + (i * slotWidth), ay);
			if (temp[i].hp <= 0) {
				array_push(destroy_cards, temp[i]);
				temp[i].destroy();
			}
		}
	}
	
	if (array_length(destroy_cards) > 0) {
		alarm[0] = 50;
	}
	cards = temp;
}

function remove_fatigue() {
	for (var i = 0; i < array_length(cards); i++) {
		if (instance_exists(cards[i])) {
			cards[i].fatigued = false;
		}
	}
}