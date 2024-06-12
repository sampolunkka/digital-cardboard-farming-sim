/// @description Insert description here
// You can write your code in this editor
if (collision_point(mouse_x, mouse_y, self, false, false)) {
	hovered = true;
	fade_alpha = min(1, fade_alpha + fade_in_increment);
	if(mouse_check_button(mb_left)) {
		room_goto(destination);
	}
} else {
	hovered = false;
	fade_alpha = max(0, fade_alpha - fade_out_increment);
}