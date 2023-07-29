/// @description Insert description here
// You can write your code in this editor
source = noone;
food = 0;
foodMultiplier = 1;
skins = 0;
skinsMultiplier = 1;
wood = 0;
woodMultiplier = 1;

function applyEffect(_slot) {
	_slot.food += food;
	_slot.skins += skins;
	_slot.wood += wood;
	
	_slot.food = _slot.food * foodMultiplier;
	_slot.skins = _slot.skins * foodMultiplier;
	_slot.wood = _slot.wood * woodMultiplier;
}