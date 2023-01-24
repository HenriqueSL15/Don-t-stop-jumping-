key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check(vk_space);

var move = key_right - key_left;

hsp = move * spd;

vsp = vsp + grv;

 



if(playable){

/// @description Insert description here
// You can write your code in this editor

//BEGIN OF GRAVITY AND AUTO KILL SYSTEM
if(place_meeting(x+hsp,y,obj_block)){
	while(!place_meeting(x+sign(hsp),y,obj_block)){
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + sign(hsp);


	
if(place_meeting(x,y+vsp,obj_block)){
	
	while(!place_meeting(x,y+sign(vsp),obj_block)){
		
			y = y + sign(vsp);
		
	}
	
	
	vsp = 0;
	//y+=spd;	
	
	
	
	if(place_meeting(x,y,obj_d3ath)){
		room_restart();
	}
}

if(!place_meeting(x,y+2,obj_ladder) && !place_meeting(x,y,obj_block) && !place_meeting(x,y,obj_stair) && SuperJump == false &&  !place_meeting(x,y,obj_baseBlock)){
	y = y + vsp;
}else{
	vsp = 0;	
	
}





//END OF GRAVITY AND AUTO KILL SYSTEM

//BEGIN PORTAL SYSTEM

if(place_meeting(x+1,y,obj_portal1) || place_meeting(x-1,y,obj_portal1)){
	
	obj_player.x = portal2x-32;
	obj_player.y = portal2y;
}else{
	if(place_meeting(x+1,y,obj_portal2) || place_meeting(x-1,y,obj_portal2)){
	
	obj_player.x = portal1x+64;
	obj_player.y = portal1y;
}
}

//END PORTAL SYSTEM

//BEGIN SUPER JUMP BLOCK SYSTEM
if(place_meeting(x,y+spd,obj_JumpBlock)){
	if(keyboard_check(vk_space)){
		SuperJump = true;
	}
}


if(SuperJump && !place_meeting(x,y,obj_ladder)){
		
				if(!place_meeting(x,y-spd,obj_baseBlock)){
					y-=2;
				}
				
				sprite_index = spr_playerJ;
				image_index = 0;
				
				if(SuperJump){
					time+=0.1;
					show_debug_message(time);
					if(time == 12){
						SuperJump = false;
						time = 0;
					}
				}
	
}

//END OF SUPER JUMP BLOCK SYSTEM




//BEGIN OF MOVEMENT SYSTEM AND STAIRS

if(key_right){
	if(!place_meeting(x+4,y,obj_block) &&  !place_meeting(x+4,y,obj_baseBlock)){
		x = x + hsp;
		image_xscale = 1;
		sprite_index = spr_playerR;
	}else{
		sprite_index = spr_player;	
	}
	
		
	
	
}else{
	if(key_left){
		if(!place_meeting(x-4,y,obj_block) &&   !place_meeting(x-4,y,obj_baseBlock)){
		x = x + hsp;
		image_xscale = -1;
		sprite_index = spr_playerR;
	}
		
	}else{
		sprite_index = spr_player;	
	}	
}

if(place_meeting(x+hsp,y,obj_stair)){
	y-=4;
}
	
if(keyboard_check(vk_space)){
	if(!place_free(x,y+1)){
		vsp = -7;
	}
	
	if(place_meeting(x,y+spd,obj_ladder)){
		vsp = -7;
	}
	
	
	if(place_meeting(x+spd,y+spd,obj_stair)){
		vsp = -7;	
	}
}	
// END OF MOVEMENT AND STAIRS SYSTEM



// BEGIN OF LADDER COLLISION

if(place_meeting(x+spd,y,obj_ladder) || place_meeting(x-spd,y,obj_ladder) && keyboard_check(vk_up) || keyboard_check(vk_down)){
	ladder = true;
}


if(ladder){

	if(place_meeting(x+spd,y,obj_ladder)){
		
		if(keyboard_check(vk_up)){
			vsp = 0;
			y -= 1;
		}else{
			if(keyboard_check(vk_down)){
				if(place_meeting(x,y+spd,obj_block)){
				ladder = false;
				y-=1;
			}else{
				y+=2;		
			}
				
			}	
		}
	}



	if(place_meeting(x,y+spd,obj_ladder)  && !place_meeting(x,y+2,obj_block)){
		//falling = true;
		if(keyboard_check(vk_down)){
			//falling = false;
			if(place_meeting(x,y+spd,obj_block)){
				ladder = false;
				y-=1;
			}else{
				y+=2;	
			}
		}	
		
	}

	if(place_meeting(x,y-spd,obj_ladder)){
		if(keyboard_check(vk_up)){
			y-=2;
			
		}	
	}
	
}
// END OF LADDER COLLISION

/* BEGIN OF LADDER FALLING SYSTEM

if(falling && place_meeting(x,y+spd,obj_ladder) && !place_meeting(x+spd,y,obj_block)){
	y++;
}else {
	
	falling = false;
}


END OF LADDER FALLING SYSTEM */ 



// BEGIN OF JUMP SYSTEM
/*
if(jump){
	
	if(jumpFrames < jumpHeight){
		if(!place_meeting(x,y-spd,obj_block)){
			
			jumpFrames+=spd;
			y-=spd*2
			sprite_index = spr_playerJ;
			image_index = 0;
			
			
		}else{
		
			jump = false;	
			jumpFrames = 0;
			
		}
	}else{
		
		jump = false;	
		jumpFrames = 0;
	}
	
	vsp = -7;
}
*/
//END OF JUMP SYSTEM



}