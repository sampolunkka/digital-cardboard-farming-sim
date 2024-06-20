// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


fontString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
+"abcdefghijklmnopqrstuvwxyz"
+ "+-ÅÖ@"
+ "0123456789"
+ "[]"
+ " .,:;/!"
+ "@#§¤*>€$£"
+ "*";
// @attack, #health, §onplay, ¤ondeath, *ondamage, >onattack, $draw, £mana
// *target

global.labelFont = font_add_sprite_ext(spr_font_card_label, fontString, true, 1);

function scr_global_font(){
}