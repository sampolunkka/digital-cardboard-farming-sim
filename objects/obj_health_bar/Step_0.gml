/// @description Insert description here
// You can write your code in this editor
if (owner != noone) {
	hp = max(0, owner.hp);
	atk = max(0, owner.attack);
	if (instance_exists(owner)) {
		x = owner.x;
		y = owner.y - sprite_get_height(owner.battler_sprite) - offset_y;
		if (offset_y > 0) {
			offset_y -= ceil(distance_to_object(owner)/3);
		} else {
			offset_y = 0;
		}
	}
}