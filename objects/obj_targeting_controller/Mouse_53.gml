/// @description Insert description here
// You can write your code in this editor

var target_unit = collision_point(mouse_x, mouse_y, obj_card, false, true);
if (target_unit != noone) {
	if(!target_unit.on_board || !target_unit.type == CardType.Unit || target_unit.hp < 1) {
		target_unit = noone;
	}
}
var target_commander = collision_point(mouse_x, mouse_y, obj_commander, false, true);
var target = noone;
switch (target_type) {
	case TargetType.Any: target = target_commander != noone ? target_commander : target_unit; break;
	case TargetType.Opponent: target = target_commander.object_index == obj_opponent ? target_commander : noone; break;
	case TargetType.Player: target = target_commander.object_index == obj_player ? target_commander : noone; break;
	case TargetType.Commander: target = target_commander; break;
	case TargetType.Unit: target = target_unit; break;
	case TargetType.PlayerUnit: if (target_unit != noone) target = target_unit.owner == obj_player ? target_unit : noone; break;
	case TargetType.OpponentUnit: if (target_unit != noone) target = target_unit.owner == obj_opponent ? target_unit : noone; break;
	case TargetType.Enemies: 
		if (target_unit != noone && target_unit.owner = obj_opponent) {
			target = target_unit;
		} else if (target_commander != noone && target_commander.object_index == obj_opponent) {
			target = target_commander;
		}
		break;
	case TargetType.Allies:
		if (target_unit != noone && target_unit.owner = obj_player) {
			target = target_unit;
		} else if (target_commander != noone && target_commander.object_index == obj_player) {
			target = target_commander;
		}
		break;
}

if (target != noone) {
	switch (target_mode) {
		case TargetMode.Attack: attack_card(target); break;
		case TargetMode.Spell: cast_spell(target); break;
	}
	instance_destroy();
}