/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

cardName = "Furs";
portrait = spr_squirrel;
effectText = "+Ö";

function getEffect() {
	var effect = instance_create_depth(0, 0, depth, obj_effect);
	effect.skins = 1;
	return effect;
}