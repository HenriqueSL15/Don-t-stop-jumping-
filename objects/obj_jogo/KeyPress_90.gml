/// @description Insert description here
// You can write your code in this editor

if(file_exists("save.nav")){
	file_delete("save.nav");
}

ini_open("save.nav");
ini_write_real("jogador","x_atual",obj_player.x);
ini_write_real("jogador","y_atual",obj_player.y);
ini_write_real("jogador","superjump",obj_player.SuperJump)
ini_write_real("jogador","room",room);

ini_close();


