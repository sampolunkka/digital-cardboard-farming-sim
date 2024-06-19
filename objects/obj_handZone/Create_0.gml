/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Override
function refresh() {
	findHandCircle(topPointX, topPointY);
	createArcPortion();
}

// Arc params
verticalOffset = 0;
horizontalOffset = 20;
leftPointX = horizontalOffset;
leftPointY =  room_height - verticalOffset;
rightPointX = room_width - horizontalOffset - 20;
rightPointY = leftPointY;
topPointX = room_width * 0.5 + horizontalOffset ;
topPointY = 140;
handRadius = 0; // Needs initial size. Init function sets final size.

// Override
maxSize = 8;
hidden = false;
face = CardFace.Up;
label = "Hand";
movementMode = CardMovementMode.Slow;

// Arcing the hand
function createArcPortion() {
	var n = getSize();
	var r = handRadius;
	
	var aDir = point_direction(x, y, rightPointX, rightPointY);
	var bDir = point_direction(x, y, leftPointX, leftPointY);
	var oDir = point_direction(x, y, room_width + horizontalOffset, y);
	
	var angleStartMax = angle_difference(oDir, bDir);
	var angleEndMax = angle_difference(oDir, aDir);
	
	var angleStart = angleStartMax + min(20, (20 + (angleEndMax - angleStartMax)/2)/n);
	var angleEnd = angleEndMax - min(20 , (20 + (angleEndMax - angleStartMax)/2)/n);
	var deg = angleEnd-angleStart; //original
	
	for (var i = 0; i < n; i++) {
		var theta = (deg/n) * i;
		theta += 3 + angleStart;
	
		var tx = x + r * cos(theta*pi/180);
		var ty = y + r * sin(theta*pi/180);
		
		var card = cards[i];
		if (card == noone){
			show_message("Something went wrong! No card to arrange in hand!");
			return;
		}
		
		card.setPosition(
			round(tx - card.sprite_width * 0.5),
			round(ty - card.sprite_height)
		);
		//card.anchorX = round(tx - card.sprite_width * 0.5);
		//card.anchorY = round(ty - card.sprite_height);
		card.setDepth(-i);
	}
	
	// set hand bounds for collisons
	if (getSize() > 0) {
		depth = 1;
		x = cards[0].anchorX;
		y = cards[0].anchorY - 5;
		image_yscale = 40;
		image_xscale = cards[max(0, getSize() - 1)].anchorX
			- cards[0].anchorX 
			+ cards[max(0, getSize() - 1)].sprite_width;
	}
}

// Helper function for finding circle to arc
function findHandCircle(topPointY, topPointX) {
	var x1 = leftPointX;
	var y1 = leftPointY;
	var x2 = rightPointX;
	var y2 = rightPointY;
	var x3 = topPointX;
	var y3 = topPointY;
	
    var x12 = x1 - x2;
    var x13 = x1 - x3;
 
    var y12 = y1 - y2;
    var y13 = y1 - y3;
 
    var y31 = y3 - y1;
    var y21 = y2 - y1;
 
    var x31 = x3 - x1;
    var x21 = x2 - x1;
	
	var sx13 = power(x1, 2) - power(x3, 2);
	var sy13 = power(y1, 2) - power(y3, 2);
 
    var sx21 = power(x2, 2) - power(x1, 2);
    var sy21 = power(y2, 2) - power(y1, 2);
	
	var f = ((sx13) * (x12)
             + (sy13) * (x12)
             + (sx21) * (x13)
             + (sy21) * (x13))
            / (2 * ((y31) * (x12) - (y21) * (x13)));
    var g = ((sx13) * (y12)
             + (sy13) * (y12)
             + (sx21) * (y13)
             + (sy21) * (y13))
            / (2 * ((x31) * (y12) - (x21) * (y13)));
			
	var c = -power(x1, 2) - power(y1, 2) - 2 * g * x1 - 2 * f * y1;
	
	var h = -g;
    var k = -f;
    var sqr_of_r = h * h + k * k - c;
	
	var r = sqrt(sqr_of_r);
	
	x = h;
	y = k + (15 - getSize()) * 2;
	handRadius = r;
}

function init() {	
	findHandCircle(topPointX, topPointY);
	createArcPortion();
}

function on_add(card) {
		card.interaction = Interaction.None;
}

function onInsert(card) {
		card.interaction = Interaction.None;
}

init();