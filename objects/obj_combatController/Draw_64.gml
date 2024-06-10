/// @description Insert description here
// You can write your code in this editor
var _path = pip_path;

var _pathLength = path_get_length(_path);
var _spacing = 8;
var _dots = _pathLength / _spacing;

var i = 0;
repeat(_dots) {
	draw_set_alpha(1 - i/_dots);
    var _pos = i / _dots;
    draw_sprite(spr_targetPip, 0, path_get_x(_path, _pos), path_get_y(_path, _pos));
    ++i;
}

draw_set_alpha(1);

draw_sprite(spr_targetArrow, 0, mouse_x, mouse_y);