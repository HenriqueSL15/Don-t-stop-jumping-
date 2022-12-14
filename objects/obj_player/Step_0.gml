/// @description Insert description here
// You can write your code in this editor

if(place_free(x,y+spd)){

	y+=spd;	

	
	if(place_meeting(x,y,obj_d3ath)){
		room_restart();
	}
}



if(place_meeting(x+1,y,obj_stair)){
	y-=2;
}

if(keyboard_check(ord("D") )){
	if(!place_meeting(x+4,y,obj_block) && !place_meeting(x+1,y,obj_stair)){
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


	
if(keyboard_check(vk_space)){
	if(!place_free(x,y+1)){
		jump = true;
	}
	
	
	if(place_meeting(x+1,y,obj_stair)){
			
		jump = true;	
	
	}
}	

if(jump){
	if(jumpFrames < jumpHeight){
			jumpFrames+=spd;
			y-=spd*2;
	}else{
		jump = false;	
		jumpFrames = 0;
	}
}



