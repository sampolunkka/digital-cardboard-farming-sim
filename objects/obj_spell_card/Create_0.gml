/// @description Insert description here
// You can write your code in this editor
event_inherited();

label = "Spell";
type = CardType.Spell;
targeted = true;

function on_cast(_target, _hand, _grave) {
	_hand.deleteCard(self);
}

function draw_effect() {
	
}