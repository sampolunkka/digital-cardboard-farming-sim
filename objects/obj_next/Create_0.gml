/// @description Insert description here
// You can write your code in this editor
function triggerClick() {
	for (var i = 0; i < instancecollisionCountber(obj_boardSlot); i++) {
		var slot = instance_find(obj_boardSlot, i);
		slot.triggerEffects();
	}
}