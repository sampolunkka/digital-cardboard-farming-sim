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
target_type = TargetType.Any;
target = noone;


// @Override
function on_cast(_target, _hand, _grave) {
	show_debug_message("Casting on target " + string(_target.object_index));
	instance_create_layer(_target.x, _target.y, "Animations", obj_flare_animation);
	_target.deal_damage(1);
}






