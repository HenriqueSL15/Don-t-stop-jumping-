/// @description Insert description here
// You can write your code in this editor

if(opacity == 0){
if(index == 0){
	opacity = 1;
	obj_player.playable = true;
	
	iniciated = 1;
	
}else if(index == 2)
	game_end();
}else if(index == 1){
	obj_player.playable = true;
	opacity = 1;
	iniciated = 1;
	if(file_exists("save.nav")){
		ini_open("save.nav");
		obj_player.x = ini_read_real("jogador","x_atual",0);
		obj_player.y = ini_read_real("jogador","y_atual",0);
		obj_player.SuperJump = ini_read_real("jogador","superjump",0);
	
		ini_close();
	
}
}
