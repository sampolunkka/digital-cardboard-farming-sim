/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

label = "Mend";
cost = 1;

info = "Spell\nHeal 1, draw a card";
portrait = noone;
actions_string = "+#\n+$"
face_up_sprite = spr_card_mend;

// Targeting
targeted = true;
target_type = TargetType.Any;
target = noone;

heal = 1;


// @Override
function on_cast(_target, _hand, _grave) {
	show_debug_message("Casting on target " + string(_target.object_index));
	instance_create_layer(_target.x, _target.y, "Animations", obj_mend_animation);
	var caster = instance_nearest(x, y, owner);
	caster.draw();
	_target.heal_damage(heal);
}






