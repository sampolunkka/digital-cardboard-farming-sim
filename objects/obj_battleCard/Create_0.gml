/// @description Insert description here
// You can write your code in this editor

// ATTRIBUTES
type = CardType.Unique;
label = "card";
cost = 1;
baseHp = 1;
hp = baseHp;
baseAttack = 1;
attack = baseAttack;
on_board = false;

// INFO
info = "Card info here";

// Effects
on_play_actions = [];
before_damage_actions = [];
on_damage_actions = [];
actives = [];

// CONTROL
placeholder = false;

// VISUAL
face_up_sprite = spr_cardBack;
faceDownSprite = spr_cardBack;
faceUpSprite = spr_cardBack
face = CardFace.Up;
hidden = true;
portrait = spr_portrait_default;
battler_sprite = spr_battler_default;
fade_in_alpha = 0;

// MOVEMENT
baseDepth = depth;
anchorX = x;
anchorY = y;
realX = x;
realY = y;
movementSnapDistance = 2;
movementSpeedMultiplier = 0.8;
movementMode = CardMovementMode.Instant;

// HP/ATK
stats_bar = noone;

//ZONE
index = 0;

function init() {
	image_speed = 0;
}

function setFace(face) {
	self.face = face;
}

function setHidden(boolean) {
	hidden = boolean;
}

function setFaceAndHidden(face, hidden) {
	setFace(face);
	setHidden(hidden);
	refresh();
}

function setPosition(tx, ty) {
	anchorX = tx;
	anchorY = ty;
}

function move_y (_ty) {
	setPosition(anchorX, anchorY + _ty);
}

function setMovement(mode) {
	movementMode = mode;
	switch (movementMode) {
		case CardMovementMode.Fast: movementSpeedMultiplier = 0.8; break;
		case CardMovementMode.Slow: movementSpeedMultiplier = 0.4; break;
		default: movementSpeedMultiplier = 1; break;
	}
}

function setDepth(value) {
	baseDepth = value;
}

function getInfo() {
	return info;
}

function isPlaceholder() {
	return placeholder;
}

function onPlay() {
	
	onSummon();
	
	for (var i = 0; i < array_length(on_play_actions); i++) {
		var action = action_create(on_play_actions[0], self, [player_get_active()]);
		action.trigger();
	}
}

// TODO: smooth hover movement 
function hover() {
	if (!on_board) {
		y = anchorY - 4;
		depth = baseDepth - 2;
	}
}

function refresh() {
	if (face == CardFace.Down) {
		sprite_index = faceDownSprite;
	} else if (face == CardFace.Up) {
		sprite_index = face_up_sprite;
	}
	
	if (hidden) {
		sprite_index = noone;
	}
}

function startCombat(target) {
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
	//image_speed = 1;
	on_board = true;
	//sprite_index = battler_sprite;
	//stats_bar = instance_create_depth(x, y - sprite_get_height(battler_sprite), depth-1, obj_health_bar);
	//stats_bar.owner = self;
	
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

function destroy() {
	if (stats_bar != noone) {
		stats_bar.destroy();
	}
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