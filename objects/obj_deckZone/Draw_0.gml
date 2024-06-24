/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();


if (shuffling) {
	for (var i = 0; i < array_length(cards); i++) {
		
		if (shuffle_timer > shuffle_timer_max * 0.5) {
			offsetX = irandom_range(0, -shuffle_timer*0.2);
			offsetY = irandom_range(shuffle_timer_max-shuffle_timer, -(shuffle_timer_max-shuffle_timer));
		} else {
			offsetX = irandom_range(0, shuffle_timer*0.2);
			offsetY = irandom_range(-shuffle_timer, shuffle_timer);
		}
		var renderX = x + offsetX;
		var renderY = y + offsetY;
	
		draw_sprite(spr_cardBack, 0, renderX, round(renderY - i * 0.2));
	}
}

