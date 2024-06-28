/// @description Insert description here
// You can write your code in this editor
event_inherited();
if (face == CardFace.Up) {
	draw_set_font(global.labelFont);
	var effect_offset_x = 10;
	var effect_offset_y = sprite_height - 9;
	// Draw card sprite
	sprite_index = face_up_sprite;
	draw_self();
	draw_sprite(spr_card_stats_underlay, on_board ? 1 : 0, x, y);

	// Draw cost and label
	if (!on_board) {
		draw_text_shadow(x + 4, y + 1, label, 0.6);
		draw_mana(x + 1, y + 10, string(cost));
	}
	
	// Draw effect
	draw_effect(x + effect_offset_x, y + effect_offset_y);
} else {
	sprite_index = face_down_sprite;
	draw_self();
}