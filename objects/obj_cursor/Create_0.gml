/// @description Insert description here
// You can write your code in this editor
global.cursor = self;

enum CursorMode {
	Neutral,
	Inspect,
	Travel,
	Grab,
	Grabbing,
	Pinching
}

mode = CursorMode.Neutral;

image_speed = 0;
image_index = 0;
depth = -2000;

window_set_cursor(cr_none);