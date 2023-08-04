/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

cardtitle = "Forest";
portrait = spr_forest;
effectText = "+@";
info = "Card info. Lorem ipsum dolor sit amet. This text is for development purposes to test how card info text boxes behave.";

function getEffect() {
	var effect = instance_create_depth(0, 0, depth, obj_effect);
	effect.wood = 1;
	return effect;
}