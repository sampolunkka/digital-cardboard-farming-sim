/// @description Action delay
// You can write your code in this editor
executeNext();
if (hasNextAction()) {
	alarm[0] = delay;
} else {
	instance_destroy();
}