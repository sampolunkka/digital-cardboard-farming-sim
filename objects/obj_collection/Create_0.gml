/// @description Insert description here
// You can write your code in this editor
collection = array_create(0, noone);


array_push(collection,
obj_field,
obj_windmill,
obj_forest,
obj_squirrels
);

function initCollection() {
	for (var i = 0; i < getLen(); i++) {
		instance_create_depth(x + 32 * i, y, depth, collection[i]);
	}
}

function getLen() {
	return array_length(collection);
}

initCollection();