/// @description Insert description here
// You can write your code in this editor
draw_sprite(sprite_index, image_index, x, y);

var food = 0;
var skins = 0;
var wood = 0;
for (var i = 0; i < array_length(effects); i++) {
	var effect = effects[i];
	food += effect.food;
	food = effect.foodMultiplier * food;
	
	skins += effect.skins;
	skins = effect.skinsMultiplier * skins;
	
	wood += effect.wood;
	wood = effect.woodMultiplier * wood;
	
}

draw_set_color(c_white);
draw_set_font(global.labelFont);

var uiString = "";

if(food > 0) uiString += string(food) + "Å";
if(skins > 0) uiString += string(skins) + "Ö";
if(wood > 0) uiString += string(wood) + "@";



draw_text(x, y-10, uiString);