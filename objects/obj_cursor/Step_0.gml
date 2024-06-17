/// @description Insert description here
// You can write your code in this editor
x =  mouse_x;
y =  mouse_y;

var interactable = collision_point(mouse_x, mouse_y, obj_interactable, false, true);
if (interactable != noone) {
	switch(interactable.interaction) {
		case Interaction.Travel: mode = CursorMode.Travel; break;
		case Interaction.Inspect: mode = CursorMode.Inspect; break;
	}
} else {
	mode = CursorMode.Neutral;
}