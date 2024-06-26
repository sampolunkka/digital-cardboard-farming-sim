/// @description Insert description here
// You can write your code in this editor
event_inherited();

/// @description Insert description here
// You can write your code in this editor

enum Zone {
	Hand,
	Deck,
	Board
}

enum Tag {
	Early,
	Mid,
	Late,
	SpotRemoval,
	Ping,
	BoardClear,
	Draw,
	Heal,
	Reach
}

// ATTRIBUTES
type = CardType.Unique;
label = "card";
cost = 1;
on_board = false;
fatigued = false;

// INFO
info = "Card info here";

// Effects
on_play_actions = [];
before_damage_actions = [];
on_damage_actions = [];
actives = [];

// CONTROL
placeholder = false;
owner = noone;
targeted = false;
target_type = TargetType.None;

// VISUAL
image_speed = 0;
face_up_sprite = spr_cardBack;
face_down_sprite = spr_cardBack;
on_board_sprite = spr_cardBack;
face = CardFace.Up;
hidden = true;
fade_in_alpha = 0;
actions_x = 8;
actions_y = 33;
actions_string =  "";

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

// Interaction
interaction = Interaction.None;

// Tags for sorting and AI
tags = [];

function set_face(face) {
	self.face = face;
}

function set_position(tx, ty) {
	anchorX = tx;
	anchorY = ty;
}

function move_y (_ty) {
	set_position(anchorX, anchorY + _ty);
}

function setMovement(mode) {
	movementMode = mode;
	switch (movementMode) {
		case CardMovementMode.Fast: movementSpeedMultiplier = 0.8; break;
		case CardMovementMode.Slow: movementSpeedMultiplier = 0.4; break;
		case CardMovementMode.Slower: movementSpeedMultiplier = 0.2; break;
		default: movementSpeedMultiplier = 1; break;
	}
}

function set_depth(value) {
	baseDepth = value;
}

function get_info() {
	return info;
}

function is_placeholder() {
	return placeholder;
}

function on_play() {
	if (type == CardType.Unit) {
		onSummon();
	}
	
	for (var i = 0; i < array_length(on_play_actions); i++) {
		var action = action_create(on_play_actions[i], self, [player_get_active()]);
		action.trigger();
	}
}

// TODO: smooth hover movement

// onko kädessä?
function hover() {
	if (!on_board) {
		y = anchorY - 4;
		depth = baseDepth - 2;
	}
}

function refresh() {
	if (face == CardFace.Down) {
		sprite_index = face_down_sprite;
	} else if (face == CardFace.Up) {
		sprite_index = face_up_sprite;
	}
	
	if (hidden) {
		sprite_index = noone;
	}
}