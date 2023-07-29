/// @description Insert description here
// You can write your code in this editor
var play = instance_create_depth(x, y, depth, obj_menuButton);
var deckManager = instance_create_depth(x, y + 20, depth, obj_menuButton);

play.destination = Board;
play.label = "Play";

deckManager.destination = DeckBuilder;
deckManager.label = "Deck";