/// @description Insert description here
// You can write your code in this editor
// Move card if out of anchor point
if (!attacking) {
	if (x != anchorX || y != anchorY) {
		if (movementMode == CardMovementMode.Instant) {
			realX = anchorX;
			realY = anchorY;
		} else {
			dx = realX - anchorX;
			dy = realY - anchorY;
	
			// Snap x? else move
			if (dx != 0) {
				if (dx > 0 && dx < movementSnapDistance) || (dx < 0 && dx > -movementSnapDistance) {
					realX = anchorX;
				} else {
					realX -= dx * movementSpeedMultiplier;
				}
			}

			// Same for y
			if (dy != 0) {
				if ((dy > 0 && dy < movementSnapDistance) || (dy < 0 && dy > -movementSnapDistance)) {
					realY = anchorY;
				} else {
					realY -= dy * movementSpeedMultiplier;
				}
			}
		}
		x = round(realX);
		y = round(realY);
	}
}

// Transition towards base depth
if (depth < baseDepth) {
	depth++;
} else if (depth > baseDepth) {
	depth--;
}