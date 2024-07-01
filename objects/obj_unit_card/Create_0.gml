event_inherited();

type = CardType.Unit;

cost = 0;
base_hp = 1;
hp = base_hp;
max_hp = base_hp;
baseAttack = 1;
attack = baseAttack;
target_type = TargetType.Enemies;

on_play_sound = snd_card_move_alt;
on_attack_sound = snd_card_move;
on_death_sound = snd_card_draw;

function start_combat(target) {
	
	var attack_event = instance_create_layer(x, y, "Instances", obj_attack_event);
	attack_event.attacker = id;
	attack_event.defender = target;
	locked = true;
	target.locked = true;
	
	var turn_controller = instance_nearest(x, y, obj_turn_controller);
	turn_controller.push_event(attack_event);
	
	fatigued = true;
	attacking = true;
}

function on_damage(damage) {
	var total_damage = damage;
	
	for (var i = 0; i < array_length(before_damage_actions); i++) {
		var action = before_damage_actions[i];
		total_damage += action.triggerAndApplyDamage(damage);
		if (!instance_exists(action)) {
			array_delete(before_damage_actions, i, 1);
		}
	}
	
	for (var i = 0; i < array_length(on_damage_actions); i++) {
		on_damage_actions[i].trigger(total_damage);
	}
	
	// Update hp
	hp -= total_damage;
}

function onSummon() {
	on_board = true;
	fatigued = true;
	audio_play_sound(on_play_sound, 0, false);
}


function after_damage() {
	// Check if dies
	if (hp <= 0) {
		var turn_controller = instance_nearest(x, y, obj_turn_controller);
		var destroy_event = instance_create_layer(x, y, "Instances", obj_destroy_unit_event);
		destroy_event.unit = id;
		turn_controller.push_event(destroy_event);
	}
}

function after_attack() {
	fatigued = true;
}

function deal_damage(_damage) {
	if (hp > 1) {
		on_damage(_damage);
		after_damage();
	}
}

function heal_damage(_heal) {
	hp = min(max_hp, hp + _heal);
}

function destroy() {
	fade_in_alpha = 0.2;
	alarm[0] = 10;
	alarm[1] = 30;
	//instance_create_layer(x, y, "Underlay", obj_card_destroy_animation);
}

function has_actions() {
	return array_length(on_play_actions)
		+ array_length(before_damage_actions)
		+ array_length(on_damage_actions) 
		> 0;
}