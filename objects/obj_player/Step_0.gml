/// @description Insert description here
// You can write your code in this editor

//BEGIN OF GRAVITY AND AUTO KILL SYSTEM
if(place_free(x,y+spd)){

	y+=spd;	

	
	if(place_meeting(x,y,obj_d3ath)){
		room_restart();
	}
}

//END OF GRAVITY AND AUTO KILL SYSTEM




//BEGIN OF MOVEMENT SYSTEM AND STAIRS

if(keyboard_check(ord("D") )){
	if(!place_meeting(x+4,y,obj_block)){
		x+=spd;
		image_xscale = 1;
	}
	
}else{
	if(keyboard_check(ord("A") )){
		if(!place_meeting(x-4,y,obj_block)){
		x-=spd;
		image_xscale = -1;
	}
		
	}	
}

if(place_meeting(x+1,y,obj_stair)){
	y-=4;
}
	
if(keyboard_check(vk_space)){
	if(!place_free(x,y+1)){
		jump = true;
	}
	
	
	if(place_meeting(x+spd,y+spd,obj_stair)){
			
		jump = true;	
	
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
			y-=2;
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
if(jump){
	if(jumpFrames < jumpHeight){
		if(!place_meeting(x,y-spd,obj_block)){
			jumpFrames+=spd;
			y-=spd*2;
		}else{
			jump = false;	
			jumpFrames = 0;
		}
	}else{
		jump = false;	
		jumpFrames = 0;
	}
}

//END OF JUMP SYSTEM



