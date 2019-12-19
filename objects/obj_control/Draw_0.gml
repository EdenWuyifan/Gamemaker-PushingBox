/// @description Insert description here
// You can write your code in this editor
if(global.win == 1){
	draw_text(160,130,"You win!!! Press 'R' to restart.");
	
	if(keyboard_check_pressed(ord("R"))){
		room_restart();
	}
}