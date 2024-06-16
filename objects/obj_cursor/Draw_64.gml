/// @description Insert description here
// You can write your code in this editor
switch (mode) {
	case CursorMode.Neutral: sprite_index = spr_cursor_neutral; break;
	case CursorMode.Inspect: sprite_index = spr_cursor_inspect; break;
	default: sprite_index = spr_cursor_neutral;
}
draw_self();
draw_text(x+16, y, mode);