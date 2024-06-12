/// @description Insert description here
// You can write your code in this editor
if (collision_point(mouse_x, mouse_y, self, false, false)) {
	hovered = true;
	text_fade_alpha = min(1, text_fade_alpha + text_fade_in_increment);
	if(mouse_check_button(mb_left)) {
		enter();
	}
} else {
	hovered = false;
	text_fade_alpha = max(0, text_fade_alpha - text_fade_out_increment);
}