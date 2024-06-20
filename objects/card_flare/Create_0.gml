/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();
type = CardType.Spell;
label = "Flare";
cost = 1;
baseAttack = 1;
attack = baseAttack;
on_play_actions = [obj_deal_damage_action];
info = "";
portrait = noone;
actions_string = "*-1#"
face_up_sprite = spr_card_flare;
targeted = true;
target_type = TargetType.Unit;

// @Override
function startCombat(target) {
	onPlay();
}






