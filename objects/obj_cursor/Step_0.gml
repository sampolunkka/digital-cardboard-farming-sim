/// @description Insert description here
// You can write your code in this editor
x =  mouse_x;
y =  mouse_y;

var interactable = collision_point(mouse_x, mouse_y, obj_interactable, false, true);
if (interactable != noone) {
	
	var owner = interactable.owner;
	
	if (owner == obj_opponent) {
		 mode = CursorMode.Neutral;
	} else {
		switch(interactable.interaction) {
			case Interaction.Travel: mode = CursorMode.Travel; break;
			case Interaction.Inspect: mode = CursorMode.Inspect; break;
			case Interaction.Grab: mode = CursorMode.Grab; break;
			case Interaction.Grabbing: mode = CursorMode.Grabbing; break;
			case Interaction.None: mode = CursorMode.Neutral; break;
		}
	}
} else {
	mode = CursorMode.Neutral;
}