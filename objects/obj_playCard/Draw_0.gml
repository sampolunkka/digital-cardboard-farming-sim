/// @description Insert description here
// You can write your code in this editor
draw_self();
if (isFaceUp()) {
	
	draw_sprite(spr_costSymbol, 0, x-2, y-2);
	draw_text_shadow(x, y-2, cost);
	
	var bottomY = y + sprite_height - sprite_get_height(spr_attackSymbol);
	//draw_sprite(spr_attackSymbol, 0, x, bottomY);
	//draw_text_shadow(x + 2, bottomY, attack);
	
	//var rightX = x + sprite_width - sprite_get_width(spr_healthSymbol);
	//draw_sprite(spr_healthSymbol, 0, rightX, bottomY);
	//(rightX + 2, bottomY, hp);
	
	draw_text_shadow(x + 3, bottomY - 3, string(attack) + "/" + string(hp));
	
	draw_sprite(spr_titleBackplate, 0, x + 4, y - 2);
	draw_text_shadow(x + 5, y-2, title);
}