event_inherited();

type = CardType.Unit;

function start_combat(target) {
	target.onDamage(attack);
	self.onDamage(target.attack);
	
	target.afterDamage();
	self.afterDamage();
}

function onDamage(damage) {
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
	
	// Before damage
	for (var i=0; i < array_length(before_damage_actions); i++) {
		var action = instance_create_layer(x, y, "Effects", before_damage_actions[i]);
		action.initWith(self);
		before_damage_actions[i] = action;
	}
	
	// On damage
	for (var i=0; i < array_length(on_damage_actions); i++) {
		var action = instance_create_layer(x, y, "Effects", on_damage_actions[i]);
		action.initWith(self);
		on_damage_actions[i] = action;
	}
}


function afterDamage() {
	// Check if dies
	if (hp <= 0) {
		zone = collision_point(x, y, obj_zone, false, true);
		zone.refresh();
	}
}

function deal_damage(_damage) {
	onDamage(_damage);
	afterDamage();
}

function destroy() {
	fade_in_alpha = 0.2;
	alarm[0] = 10;
	alarm[1] = 30;
}

function has_actions() {
	return array_length(on_play_actions)
		+ array_length(before_damage_actions)
		+ array_length(on_damage_actions) 
		> 0;
}