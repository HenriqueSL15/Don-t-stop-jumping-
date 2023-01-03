/// @description Insert description here
// You can write your code in this editor


if(file_exists("save.nav")){
	ini_open("save.nav");
	obj_player.x = ini_read_real("jogador","x_atual",0);
	obj_player.y = ini_read_real("jogador","y_atual",0);
	obj_player.SuperJump = ini_read_real("jogador","superjump",0);
	
	ini_close();
}

