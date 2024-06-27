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
	target.on_damage(attack);
	self.on_damage(target.attack);
	
	target.after_damage();
	self.after_damage();
	
	self.after_attack();
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
		var n = instance_number(obj_boardZone);
		for (var i = 0; i < n; i++) {
			var board = instance_find(obj_boardZone, i);
			board.set_destroy(id);
		}
	}
}

function after_attack() {
	fatigued = true;
}

function deal_damage(_damage) {
	on_damage(_damage);
	after_damage();
}

function heal_damage(_heal) {
	hp = min(max_hp, hp + _heal);
}

function destroy() {
	fade_in_alpha = 0.2;
	alarm[0] = 10;
	alarm[1] = 30;
	instance_create_layer(x, y, "Underlay", obj_card_destroy_animation);
}

function has_actions() {
	return array_length(on_play_actions)
		+ array_length(before_damage_actions)
		+ array_length(on_damage_actions) 
		> 0;
}