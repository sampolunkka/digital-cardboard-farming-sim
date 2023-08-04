/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

portrait = spr_windmill;
cardtitle = "Mill";
effectText = "Åx2";

function getEffect() {
	var effect = instance_create_depth(0, 0, depth, obj_effect);
	effect.foodMultiplier = 2;
	return effect;
}