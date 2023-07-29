/// @description Insert description here
// You can write your code in this editor

//x = baseX;
//y = baseY;

if (movementMode == CardMovementMode.Instant) {
	x = baseX;
	y = baseY;
} else {
	dx = x-baseX;
	dy = y-baseY;
	
	// Snap x? else move
	if (dx != 0) {
		if (dx > 0 && dx < movementSnapDistance) || (dx < 0 && dx > -movementSnapDistance) {
			x = baseX;
		} else {
			x -= round(dx * movementSpeedMultiplier);
		}
	}

	// Same for y
	if (dy != 0) {
		if ((dy > 0 && dy < movementSnapDistance) || (dy < 0 && dy > -movementSnapDistance)) {
			y = baseY;
		} else {
			y -= round(dy * movementSpeedMultiplier);
		}
	}
}

/* Smooth movement
if (y != baseY || x != baseX) {
	
	var distance = distance_to_point(baseX, baseY);
	
	if (x < baseX) {
		x += round(distance_to_point(baseX, y) * 0.2);
	} else if (x > baseY) {
		x -= round(distance_to_point(baseX, y) * 0.2);
	}
	
	if (y < baseY) {
		y += round(distance_to_point(x, baseY) * 0.2);
	} else if (y > baseY) {
		y -= round(distance_to_point(x, baseY) * 0.2);
	}
	
	// Snap to position
	if (distance < movementSnapDistance) {
		x = baseX;
		y = baseY;
	}
}*/