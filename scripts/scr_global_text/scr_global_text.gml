// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_global_text(){

}

function draw_text_shadow(tx, ty, str) {
	str = string(str); 	// Cast as string to prevent unintended behaviour
	draw_set_color(c_black);
	draw_text(tx + 1, ty + 1, str);
	draw_set_color(c_white);
	draw_text(tx, ty, str);
}

function draw_text_shadow_color(tx, ty, str, color) {
	str = string(str); 	// Cast as string to prevent unintended behaviour
	draw_set_color(c_black);
	draw_text(tx + 1, ty + 1, str);
	draw_set_color(color);
	draw_text(tx, ty, str);
}