/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(spr_large_card_overlay, min(12, big_card_animation_frame), x ,y, 1, 1, 0, c_white, big_card_fade_alpha);
if (big_card_fade_alpha < 0.8) {
	image_speed = 2;
	image_alpha = animation_alpha;
	draw_self();
}