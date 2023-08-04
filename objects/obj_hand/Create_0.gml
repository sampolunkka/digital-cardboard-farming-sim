/// @description Insert description here
// You can write your code in this editor
cards = noone;
maxHandSize = 7;

cards[0] = instance_create_layer(0, 0, "Instances", obj_field);
cards[1] = instance_create_layer(0, 0, "Instances", obj_windmill);
cards[2] = instance_create_layer(0, 0, "Instances", obj_field);
cards[3] = instance_create_layer(0, 0, "Instances", obj_windmill);
cards[4] = instance_create_layer(0, 0, "Instances", obj_forest);
cards[5] = instance_create_layer(0, 0, "Instances", obj_squirrels);


focusedCardIndex = noone;
placeHolderInd = noone;

handRadius = 0;
verticalOffset = 0;
horizontalOffset = 20;
leftPointX =horizontalOffset;
leftPointY = room_height - verticalOffset;
rightPointX = room_width - horizontalOffset - 20;
rightPointY = leftPointY;

topPointX = room_width * 0.5 + horizontalOffset;
topPointY = 140;


function createArcPortion() {
	var n = array_length(cards);
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
		card.x = round(tx - card.sprite_width * 0.5);
		card.y = round(ty - card.sprite_height);
		card.anchorY = card.y;
		card.anchorX = card.x;
		card.handIndex = i;
	}
}

function highlightCard(_index) {
	// reset highlight with negative calues
	if (_index < 0) {
		if (focusedCardIndex != noone) {
			cards[focusedCardIndex].highlighted = false;
			focusedCardIndex = noone;
		}
	}
	// highlight card
	focusedCardIndex = _index;
	if(focusedCardIndex != noone) {
		cards[focusedCardIndex].highlighted = true;
	}
	for (var i = 0; i < array_length(cards); i++) {
		if (i != focusedCardIndex) {
			cards[i].highlighted = false;
		}
	}
}

function findCircleCenterOld(x1, y1, x2, y2, r) {
	//mirrorDistance =sqrt(pow(radius,2) - pow(separation/2,2));
	//(p1.x+p2.x)/2 + mirrorDistance*(p1.y-p2.y)/separation
	
	var separation = point_distance(x1, y1, x1, x2);
	var mirrorDistance = sqrt(power(r, 2) - power(separation/2,2));
	var centerX = (x1 + x2)/2 + mirrorDistance * (y1 + y2)/separation;
	var centerY = (y1 + y2)/2 + mirrorDistance * (x1 + x2)/separation;
	x = centerX;
	y = centerY;
}

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
	y = k + (10 - getHandSize()) * 2;
	handRadius = r;
}

function dragCard(card) {
	var ind = array_get_index(cards, card);
	card.highlighted = false;
	cards[ind] = instance_create_layer(x,y,"Instances",obj_placeHolder);
	placeHolderInd = ind;
	initHand();
}

function movePlaceHolder(_targetIndex) {
	var placeHolder = cards[placeHolderInd];
	var list = ds_list_create();
	for(var i = 0; i < array_length(cards); i++) {
		ds_list_insert(list, i, cards[i]);
	}
	ds_list_delete(list, ds_list_find_index(list,placeHolder));
	ds_list_insert(list, _targetIndex, placeHolder);
	for(var i = 0; i < array_length(cards); i++) {
		cards[i] = list[|i];
	}
	ds_list_destroy(list);
	placeHolderInd = _targetIndex;
	initHand();
}

function returnToPlaceHolder(_draggedCard) {
	instance_destroy(cards[placeHolderInd]);
	cards[placeHolderInd] = _draggedCard;
	placeHolderInd = noone;
	initHand();
}

function addCard(_card) {
	array_push(cards, instance_create_layer(x,y,"Instances",_card));
	initHand()
}

function removePlaceholders() {
	var temp = cards[placeHolderInd];
	array_delete(cards, placeHolderInd, 1);
	instance_destroy(temp);
	placeHolderInd = noone;
	initHand();
}

function isFull() {
	return array_length(cards) >= maxHandSize;
}

function popCard() {
	if (getHandSize() < 1) {
		return;
	}
	instance_destroy(array_pop(cards));
	initHand();
}

function getHandSize() {
	return array_length(cards);
}

function initHand() {
	findHandCircle(topPointY, topPointX);
	createArcPortion();
}

initHand();