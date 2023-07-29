/// @description Insert description here
// You can write your code in this editor

var offsetX = 0;
var offsetY = 0;

for (var i = 0; i < array_length(cards); i++) {
	if (shuffling) {
		
		if (shuffleTimer > shuffleTimerMax * 0.5) {
			offsetX = irandom_range(0, -shuffleTimer*0.2);
			offsetY = irandom_range(shuffleTimerMax-shuffleTimer, -(shuffleTimerMax-shuffleTimer));
		} else {
			offsetX = irandom_range(0, shuffleTimer*0.2);
			offsetY = irandom_range(-shuffleTimer, shuffleTimer);
		}
	}
	
	var renderX = x + offsetX;
	var renderY = y + offsetY;
	
	draw_sprite(spr_cardBack, 0, renderX, round(renderY - i * 0.2));
}