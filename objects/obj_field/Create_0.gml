/// @description Insert description here
// You can write your code in this editor
event_inherited();
portrait = spr_farm;
title = "Farm";

highlighted = false;
baseDepth = depth;
anchorY = y;
anchorX = x;
highlightMovementDistance = 5;
handIndex = 1;
yOffset = 0;
//isPlaceholder = false;
effectText = "+Å";
info = "Can be placed anywhere. Produces 2 food per turn.";

function getEffect() {
	var effect = instance_create_layer(0, 0, "Instances", obj_effect);
	effect.food = 1;
	effect.source = self;
	return effect;
}