/// @description Insert description here
// You can write your code in this editor
var tx1;
var ty1;
var tx2;
var ty2;

// Get constraints
tx1 = card.x;
tx2 = card.x + string_width(formattedText);
ty1 = card.y - 4 - string_height(formattedText);
ty2 = card.y - 4;
	
// Prevent out of screen box
if (ty1 < 0) {
	ty1 += 2 * card.sprite_height;
	ty2 += 2 * card.sprite_height;
}

// Draw box
draw_set_color(c_black);
draw_set_alpha(0.6);
draw_rectangle(tx1, ty1, tx2, ty2, false);
draw_set_alpha(1);

// Draw text
draw_set_color(c_white);
draw_text(tx1, ty1, formattedText);