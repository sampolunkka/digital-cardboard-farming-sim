/// @description Insert description here
// You can write your code in this editor
attackingCard = noone;

function getOpponentCard() {
	var target  = collision_point(mouse_x, mouse_y, obj_playCard, false, true);
	if (isOpponentCard(target)) {
		return target;
	}
	return noone;
}

function isOpponentCard(card) {
	var opController = instance_nearest(mouse_x, mouse_y, obj_opponentCardController);
	//show_message("opController: " + string(opController.id));
	var opBoard = opController.board;
	//show_message("OpBoard: " + string(opBoard.id));
	if (opBoard.hasCard(card)) {
		//show_message("Target is opponent card");
		return true;
	}
	//show_message("Target is not opponent card");
	return false;
}

function attackCard(target) {
	var card = attackingCard;
	card.startCombat(target);
}

function init(card) {
	x = card_get_center_x(card);
	y = card_get_center_y(card);
	attackingCard = card;
}