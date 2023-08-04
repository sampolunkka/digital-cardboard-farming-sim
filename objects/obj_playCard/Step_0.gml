/// @description Insert description here
// You can write your code in this editor

//x = anchorX;
//y = anchorY;

if (movementMode == CardMovementMode.Instant) {
	x = anchorX;
	y = anchorY;
} else {
	dx = x-anchorX;
	dy = y-anchorY;
	
	// Snap x? else move
	if (dx != 0) {
		if (dx > 0 && dx < movementSnapDistance) || (dx < 0 && dx > -movementSnapDistance) {
			x = anchorX;
		} else {
			x -= round(dx * movementSpeedMultiplier);
		}
	}

	// Same for y
	if (dy != 0) {
		if ((dy > 0 && dy < movementSnapDistance) || (dy < 0 && dy > -movementSnapDistance)) {
			y = anchorY;
		} else {
			y -= round(dy * movementSpeedMultiplier);
		}
	}
}

/* Smooth movement
if (y != anchorY || x != anchorX) {
	
	var distance = distance_to_point(anchorX, anchorY);
	
	if (x < anchorX) {
		x += round(distance_to_point(anchorX, y) * 0.2);
	} else if (x > anchorY) {
		x -= round(distance_to_point(anchorX, y) * 0.2);
	}
	
	if (y < anchorY) {
		y += round(distance_to_point(x, anchorY) * 0.2);
	} else if (y > anchorY) {
		y -= round(distance_to_point(x, anchorY) * 0.2);
	}
	
	// Snap to position
	if (distance < movementSnapDistance) {
		x = anchorX;
		y = anchorY;
	}
}*/