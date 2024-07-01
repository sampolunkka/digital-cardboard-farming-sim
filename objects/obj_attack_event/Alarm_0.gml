/// @description Insert description here
// You can write your code in this editor
defender.on_damage(attacker.attack);
attacker.on_damage(defender.attack);
	
defender.after_damage();
attacker.after_damage();
	
attacker.after_attack();
attacker.attacking = false;
path_delete(path);

if (attacker.hp > 0) {
	attacker.locked = false;
}
if (defender.hp > 0) {
	defender.locked = false;
}
instance_destroy();