/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 29B65928
/// @DnDArgument : "code" "//setting variables for keys$(13_10)key_right = keyboard_check(vk_right);$(13_10)key_left = -keyboard_check(vk_left);$(13_10)key_jump = keyboard_check(vk_space);$(13_10)key_jump_released = keyboard_check_released(vk_space)$(13_10)key_sprint = keyboard_check(vk_shift);$(13_10)key_dash = keyboard_check(vk_control);$(13_10)//set move to -1 or 1 respectively$(13_10)move = key_left + key_right;$(13_10)//check $(13_10)if(key_sprint && move != 0)$(13_10){$(13_10)	if(hsp < 14 && hsp > -14 )$(13_10)	{$(13_10)		if(hsp == 0)$(13_10)			hsp = (movespeed+1) * move;$(13_10)		hsp = (abs(hsp)*1.03)*move;$(13_10)	}$(13_10)	if(hsp < -14 && move == 1)$(13_10)		hsp = 0;$(13_10)	if(hsp > 14 && move == -1)$(13_10)		hsp = 0;$(13_10)		$(13_10)}$(13_10)else$(13_10){$(13_10)	hsp = (movespeed+1) * move;	$(13_10)}$(13_10)$(13_10)if(move == 0)$(13_10)	sprite_index = Standing;$(13_10)$(13_10)if(move > 0)$(13_10){$(13_10)	sprite_index = WalkingRight;$(13_10)}$(13_10)if(move < 0)$(13_10){$(13_10)	sprite_index = WalkingLeft;$(13_10)}$(13_10)$(13_10)if(key_jump_released)$(13_10)	released = 1;  $(13_10)if(place_meeting(x,y-1,wall) || place_meeting(x,y-1,face) || place_meeting(x,y-1,movingPlatform))$(13_10){$(13_10)	height_jump_reached = 1;$(13_10)}$(13_10)	$(13_10)//jumping stuff$(13_10)vsp = vsp + grav;$(13_10)//hard coded so that when you are going fast enough you will stop moving up$(13_10)if(vsp < -16 || key_jump_released)$(13_10)	height_jump_reached = 1;$(13_10)if(key_jump && height_jump_reached == 0)$(13_10){$(13_10)	if(released == 1 && key_jump && (place_meeting(x,y+1,face) || place_meeting(x,y+1,wall) || place_meeting(x,y+1,movingPlatform)))$(13_10)	{$(13_10)		released = 0;$(13_10)		vsp = -13;$(13_10)	}$(13_10)	if(released == 0 && !place_meeting(x,y+1,face) && !place_meeting(x,y+1,wall) && !place_meeting(x,y+1,movingPlatform))$(13_10)	{$(13_10)		vsp -=4;$(13_10)	}$(13_10)}$(13_10)if(key_jump_released && !place_meeting(x,y+1,face) && !place_meeting(x,y+1,wall) && !place_meeting(x,y+1,movingPlatform))$(13_10){$(13_10)	if(vsp < 0)$(13_10)		vsp /= 1.5;$(13_10)}$(13_10)$(13_10)//horizontal collision$(13_10)hittingWall = 0;$(13_10)if(place_meeting(x+hsp,y,wall))$(13_10){$(13_10)	hittingWall = 1;$(13_10)	show_debug_message("player_why")$(13_10)	while(!place_meeting(x+sign(hsp),y,wall))$(13_10)	{$(13_10)		x +=sign(hsp);$(13_10)	}$(13_10)	hsp = 0;$(13_10)	$(13_10)}$(13_10)if(place_meeting(x+hsp,y,movingPlatform))$(13_10){$(13_10)	hittingWall = 1;$(13_10)	while(!place_meeting(x+sign(hsp),y,movingPlatform))$(13_10)	{$(13_10)		x +=sign(hsp);$(13_10)	}$(13_10)	hsp = 0;$(13_10)}$(13_10)if(place_meeting(x+hsp,y,face))$(13_10){$(13_10)	hittingWall = 1;$(13_10)	while(!place_meeting(x+sign(hsp),y,face))$(13_10)	{$(13_10)		x +=sign(hsp);$(13_10)	}$(13_10)	hsp = 0;$(13_10)}$(13_10)x+=hsp;$(13_10)//vertical collision$(13_10)if(place_meeting(x,y+vsp,wall))$(13_10){$(13_10)	while(!place_meeting(x,y+sign(vsp),wall))$(13_10)	{$(13_10)		y +=sign(vsp);$(13_10)	}$(13_10)	vsp = 0;$(13_10)	if(place_meeting(x,y+1,wall))$(13_10)	{$(13_10)		height_jump_reached = 0;$(13_10)	}$(13_10)}$(13_10)if(place_meeting(x,y+vsp,movingPlatform))$(13_10){	$(13_10)	if(movingPlatform.bool == 0)$(13_10)		x+= -2;$(13_10)	else$(13_10)		x+= 2;$(13_10)	while(!place_meeting(x,y+sign(vsp),movingPlatform))$(13_10)	{	$(13_10)		y +=sign(vsp);$(13_10)	}$(13_10)	vsp = 0;$(13_10)	if(place_meeting(x,y+1,movingPlatform))$(13_10)	{$(13_10)		height_jump_reached = 0;$(13_10)	}$(13_10)}$(13_10)if(place_meeting(x,y+vsp,face))$(13_10){$(13_10)	while(!place_meeting(x,y+sign(vsp),face))$(13_10)	{$(13_10)		y +=sign(vsp);$(13_10)	}$(13_10)	vsp = 0;$(13_10)	if(place_meeting(x,y+1,face))$(13_10)	{$(13_10)		height_jump_reached = 0;$(13_10)	}$(13_10)	$(13_10)}$(13_10)$(13_10)$(13_10)y+=vsp;$(13_10)$(13_10)// STEP EVENT OF THE PLAYER OR SOME CONTROLLER OBJECT$(13_10)var _cam_x = camera_get_view_x(view_camera[0]) ;$(13_10)layer_x("Background_1_1", _cam_x * -0.1); // Change the background layer name to whatever you use in the room editor$(13_10)layer_x("Background_1", _cam_x * -0.005);   // Change the 0.25 and 0.5 values to change the speed of the effect"
//setting variables for keys
key_right = keyboard_check(vk_right);
key_left = -keyboard_check(vk_left);
key_jump = keyboard_check(vk_space);
key_jump_released = keyboard_check_released(vk_space)
key_sprint = keyboard_check(vk_shift);
key_dash = keyboard_check(vk_control);
//set move to -1 or 1 respectively
move = key_left + key_right;
//check 
if(key_sprint && move != 0)
{
	if(hsp < 14 && hsp > -14 )
	{
		if(hsp == 0)
			hsp = (movespeed+1) * move;
		hsp = (abs(hsp)*1.03)*move;
	}
	if(hsp < -14 && move == 1)
		hsp = 0;
	if(hsp > 14 && move == -1)
		hsp = 0;
		
}
else
{
	hsp = (movespeed+1) * move;	
}

if(move == 0)
	sprite_index = Standing;

if(move > 0)
{
	sprite_index = WalkingRight;
}
if(move < 0)
{
	sprite_index = WalkingLeft;
}

if(key_jump_released)
	released = 1;  
if(place_meeting(x,y-1,wall) || place_meeting(x,y-1,face) || place_meeting(x,y-1,movingPlatform))
{
	height_jump_reached = 1;
}
	
//jumping stuff
vsp = vsp + grav;
//hard coded so that when you are going fast enough you will stop moving up
if(vsp < -16 || key_jump_released)
	height_jump_reached = 1;
if(key_jump && height_jump_reached == 0)
{
	if(released == 1 && key_jump && (place_meeting(x,y+1,face) || place_meeting(x,y+1,wall) || place_meeting(x,y+1,movingPlatform)))
	{
		released = 0;
		vsp = -13;
	}
	if(released == 0 && !place_meeting(x,y+1,face) && !place_meeting(x,y+1,wall) && !place_meeting(x,y+1,movingPlatform))
	{
		vsp -=4;
	}
}
if(key_jump_released && !place_meeting(x,y+1,face) && !place_meeting(x,y+1,wall) && !place_meeting(x,y+1,movingPlatform))
{
	if(vsp < 0)
		vsp /= 1.5;
}

//horizontal collision
hittingWall = 0;
if(place_meeting(x+hsp,y,wall))
{
	hittingWall = 1;
	show_debug_message("player_why")
	while(!place_meeting(x+sign(hsp),y,wall))
	{
		x +=sign(hsp);
	}
	hsp = 0;
	
}
if(place_meeting(x+hsp,y,movingPlatform))
{
	hittingWall = 1;
	while(!place_meeting(x+sign(hsp),y,movingPlatform))
	{
		x +=sign(hsp);
	}
	hsp = 0;
}
if(place_meeting(x+hsp,y,face))
{
	hittingWall = 1;
	while(!place_meeting(x+sign(hsp),y,face))
	{
		x +=sign(hsp);
	}
	hsp = 0;
}
x+=hsp;
//vertical collision
if(place_meeting(x,y+vsp,wall))
{
	while(!place_meeting(x,y+sign(vsp),wall))
	{
		y +=sign(vsp);
	}
	vsp = 0;
	if(place_meeting(x,y+1,wall))
	{
		height_jump_reached = 0;
	}
}
if(place_meeting(x,y+vsp,movingPlatform))
{	
	if(movingPlatform.bool == 0)
		x+= -2;
	else
		x+= 2;
	while(!place_meeting(x,y+sign(vsp),movingPlatform))
	{	
		y +=sign(vsp);
	}
	vsp = 0;
	if(place_meeting(x,y+1,movingPlatform))
	{
		height_jump_reached = 0;
	}
}
if(place_meeting(x,y+vsp,face))
{
	while(!place_meeting(x,y+sign(vsp),face))
	{
		y +=sign(vsp);
	}
	vsp = 0;
	if(place_meeting(x,y+1,face))
	{
		height_jump_reached = 0;
	}
	
}


y+=vsp;

// STEP EVENT OF THE PLAYER OR SOME CONTROLLER OBJECT
var _cam_x = camera_get_view_x(view_camera[0]) ;
layer_x("Background_1_1", _cam_x * -0.1); // Change the background layer name to whatever you use in the room editor
layer_x("Background_1", _cam_x * -0.005);   // Change the 0.25 and 0.5 values to change the speed of the effect