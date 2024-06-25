// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

global.debugEnabled = true;
global.debugZoneCardInfo = true && global.debugEnabled;
global.debugCardDepth = true && global.debugEnabled;
global.debugShowPlaceholder = true && global.debugEnabled;
global.debugShowZoneHitbox = true && global.debugEnabled;

function scr_global_debug(){

}

function debug_show_zone_card_info() {
	return global.debugZoneCardInfo;
}

function debug_show_card_depth() {
	return global.debugCardDepth;
}

function mask_instance_ref(instance) {
	return string_replace(instance.id, "ref instance ", "");
}