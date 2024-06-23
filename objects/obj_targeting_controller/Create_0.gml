/// @description Insert description here
// You can write your code in this editor

enum TargetType {
	Any,
	PlayerUnit,
	OpponentUnit,
	Player,
	Opponent,
	Commander,
	Unit,
	None
}

enum TargetMode {
	Attack,
	Spell,
	None
}

target_type = TargetType.Any;
target_mode = TargetMode.None;

targeting_card = noone;

hand = noone;
grave = noone;

cursor = instance_nearest(x, y, obj_cursor);

// Setup targeting arrow
pip_path = path_add();
path_add_point(pip_path, mouse_x, mouse_y, distance_to_point(mouse_x, mouse_y)/5);
path_add_point(pip_path, x, y, distance_to_point(mouse_x, mouse_y)/5);
path_set_closed(pip_path, false);
path_set_kind(pip_path, true);

function attack_card(_target) {
	targeting_card.start_combat(_target);
}

function cast_spell(_target) {
	targeting_card.on_cast(_target, hand, grave);
}

function init(_card, _target_type, _hand, _grave) {
	target_type = _target_type;
	targeting_card = _card;
	hand = _hand ?? noone;
	grave = _grave ?? noone;
	
	switch (targeting_card.type) {
		case CardType.Spell: target_mode = TargetMode.Spell; break;
		case CardType.Unit: target_mode = TargetMode.Attack; break;
		default: show_message("Error, cannot resolve targeting mode for card " + string(_card));
	}
}