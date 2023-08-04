/// @description Insert description here
//

actions = [];
phaseBeginActions = [];
phaseEndActions = [];

function onPhaseBegin() {
}

function onPhaseEnd() {
}

function addAction(action, origin, targets) {
	action.init(origin, targets);
	array_push(actions, action);
}

function executeNext() {
	var action = array_pop(actions);
	action.trigger();
}

function executeAction(action) {
	var ind = array_get_index(actions, action);
	if (ind < 0) {
		return;
	}
	var triggeredAction = array_get(actions, action);
	array_delete(actions, ind, 1);
	triggeredAction.trigger();
}

function hasNextAction() {
	return array_length(actions) > 0;
}