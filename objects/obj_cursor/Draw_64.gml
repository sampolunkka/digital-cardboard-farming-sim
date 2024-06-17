/// @description Insert description here
// You can write your code in this editor
switch (mode) {
	case CursorMode.Neutral: sprite_index = spr_cursor_neutral; break;
	case CursorMode.Inspect: sprite_index = spr_cursor_grab; break;
	case CursorMode.Travel: sprite_index = spr_cursor_neutral; break;
	default: sprite_index = spr_cursor_neutral;
}
draw_self();
if (global.debugEnabled) {
	draw_text(x+16, y, mode);
}