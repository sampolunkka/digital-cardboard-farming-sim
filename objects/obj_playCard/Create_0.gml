/// @description Insert description here
// You can write your code in this editor

// ATTRIBUTES
type = CardType.Unique;
title = "card";
cost = 1;
baseHp = 1;
hp = baseHp;
baseAttack = 1;
attack = baseAttack;

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
faceDownSprite = spr_cardBack;
faceUpSprite = spr_card_stats_overlay;
face = CardFace.Down;
hidden = true;
portrait = spr_portrait_default;

// MOVEMENT
baseDepth = depth;
anchorX = x;
anchorY = y;
realX = x;
realY = y;
movementSnapDistance = 2;
movementSpeedMultiplier = 0.8;
movementMode = CardMovementMode.Instant;

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
	y = anchorY - 4;
	depth = baseDepth - 2;
}

function isFaceUp() {
	return face == CardFace.Up;
}

function refresh() {
	if (face == CardFace.Down) {
		sprite_index = faceDownSprite;
	} else if (face == CardFace.Up) {
		sprite_index = faceUpSprite;
	}
	
	if (hidden) {
		sprite_index = noone;
	}
}

function startCombat(target) {
	target.defend(self, attack);
	onDamage(target.getDefendDamage());
	afterDamage();
	target.afterDamage();
}

function defend(attacker, damage) {
	onDamage(damage);
}

function getDefendDamage() {
	return attack;
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
		var playerControl = instance_nearest(x, y, obj_playerCardController);
		var playerBoard = playerControl.board;
		playerBoard.deleteCard(self);
	}
}