/// @description Insert description here
// You can write your code in this editor
// Inherit the parent event
event_inherited();

label = "Purify";
cost = 5;

info = string(label) + "\nDeal 2 to all enemies, heal 2 from all allies.";
face_up_sprite = spr_card_purify;

// Targeting
targeted = false;
target_type = TargetType.None;
target = noone;

damage = 2;
heal = 2;

// @Override
function on_cast(_target, _hand, _grave) {
	var n = instance_number(obj_unit_card);
	for (var i = 0; i < n; i++) {
		var unit = instance_find(obj_unit_card, i);
		if (unit.on_board) {
			if (unit.owner == obj_player) {
				unit.heal_damage(heal);
			} else if (unit.owner == obj_opponent) {
				unit.deal_damage(damage);
			}
		}
	}
	
	_hand.moveCard(id, _grave);
}

function draw_effect(_x, _y) {
	draw_text_shadow(_x, _y - 8, "E");
	draw_damage(_x + 5, _y - 8, "2");
	draw_text_shadow(_x, _y, "A");
	draw_heal(_x + 5, _y, "2");
}



