/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

label = "Flare";
cost = 1;

info = "";
portrait = noone;
actions_string = "*-1#"
face_up_sprite = spr_card_flare;

// Targeting
targeted = true;
target_type = TargetType.Unit;
target = noone;


// @Override
function on_cast(_target, _hand, _grave) {
	show_debug_message("Casting on target " + string(_target.object_index));
	_target.deal_damage(1);
	_hand.moveCard(id, _grave);
}





