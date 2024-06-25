/// @description Insert description here
// You can write your code in this editor
x = card_get_center_x(targeting_card);
y = card_get_center_y(targeting_card);
path_change_point(pip_path, 0, mouse_x, mouse_y, distance_to_point(mouse_x, mouse_y)/5);
//path_change_point(pip_path, 1, x + (mouse_x - x)/2, mouse_y - 20, distance_to_point(mouse_x, mouse_y)/5);
path_change_point(pip_path, 1, x, y, distance_to_point(mouse_x, mouse_y)/5);