/// @description Insert description here
// You can write your code in this editor
cursor = instance_nearest(x, y, obj_cursor);
attackingCard = noone;
pip_path = path_add();
path_add_point(pip_path, mouse_x, mouse_y, distance_to_point(mouse_x, mouse_y)/5);
//path_add_point(pip_path, x + x-mouse_x/2, mouse_y - 20, distance_to_point(mouse_x, mouse_y)/5);
path_add_point(pip_path, x, y, distance_to_point(mouse_x, mouse_y)/5);
path_set_closed(pip_path, false);
path_set_kind(pip_path, true);


function getDist() {
	
}

function getOpponentCard() {
	var target  = collision_point(mouse_x, mouse_y, obj_battleCard, false, true);
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
	attackingCard = card;
}