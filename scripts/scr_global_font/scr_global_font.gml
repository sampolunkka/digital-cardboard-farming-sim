// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


fontString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
+"abcdefghijklmnopqrstuvwxyz"
+ "+-ÅÖ@"
+ "0123456789"
+ "[]"
+ " .,:;/";
global.titleFont = font_add_sprite_ext(spr_font_card_title, fontString, true, 1);

function scr_global_font(){
}