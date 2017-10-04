/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 29B65928
/// @DnDArgument : "code" "key_right = keyboard_check(vk_right);$(13_10)key_left = -keyboard_check(vk_left);$(13_10)key_jump = keyboard_check(vk_space);$(13_10)key_sprint = keyboard_check(vk_shift);$(13_10)key_dash = keyboard_check(vk_control);$(13_10)$(13_10)move = key_left + key_right;$(13_10)if(key_sprint)$(13_10)	hsp = movespeed * move;$(13_10)else if(dashMode == 0)$(13_10)	hsp = (movespeed-10) * move;$(13_10)$(13_10)if(key_dash && dashMode == 0)$(13_10){$(13_10)    dashMode = 1;$(13_10)	speedx = hsp;$(13_10)	hsp += 20*move;$(13_10)}$(13_10)if(move > 0)$(13_10){$(13_10)	if(dashMode && hsp > speedx-10 && hsp > (movespeed-10) * move)$(13_10)		hsp += 3*move*-1;$(13_10)	else if(dashMode && (hsp <= speedx-10 || hsp <= (movespeed-10) * move))$(13_10)		dashMode = 0;$(13_10)}$(13_10)if(move < 0)$(13_10){$(13_10)	if(dashMode && hsp < speedx+10 && hsp < (movespeed-10) * move)$(13_10)		hsp += 3*move*-1;$(13_10)	else if(dashMode && (hsp >= speedx+10 || hsp >= (movespeed-10) * move))$(13_10)		dashMode = 0;$(13_10)}$(13_10)$(13_10)$(13_10)	$(13_10)$(13_10)vsp = vsp + grav;$(13_10)$(13_10)if(place_meeting(x,y+1,wall))$(13_10){$(13_10)	firstJump = 0;$(13_10)}$(13_10)$(13_10)if((place_meeting(x,y+1,wall) || place_meeting(x,y+1,movingPlatform)) && key_jump)$(13_10){$(13_10)	vsp = -18;$(13_10)}$(13_10)//wallJump$(13_10)if(place_meeting(x+1,y,wall) || place_meeting(x-1,y,wall))$(13_10){$(13_10)	if(key_jump && firstJump == 0)$(13_10)	{$(13_10)		vsp = -18;$(13_10)		firstJump = 1;$(13_10)	}$(13_10)}$(13_10)$(13_10)//horizontal collision$(13_10)if(place_meeting(x+hsp,y,wall))$(13_10){$(13_10)	while(!place_meeting(x+sign(hsp),y,wall))$(13_10)	{$(13_10)		x +=sign(hsp);$(13_10)	}$(13_10)	hsp = 0;$(13_10)}$(13_10)if(place_meeting(x+hsp,y,movingPlatform))$(13_10){$(13_10)	while(!place_meeting(x+sign(hsp),y,movingPlatform))$(13_10)	{$(13_10)		x +=sign(hsp);$(13_10)	}$(13_10)	hsp = 0;$(13_10)}$(13_10)//vertical collision$(13_10)if(place_meeting(x,y+vsp,wall))$(13_10){$(13_10)	while(!place_meeting(x,y+sign(vsp),wall))$(13_10)	{$(13_10)		y +=sign(vsp);$(13_10)	}$(13_10)	vsp = 0;$(13_10)}$(13_10)$(13_10)if(place_meeting(x,y+vsp,movingPlatform))$(13_10){$(13_10)	if(movingPlatform.bool == 0)$(13_10)		x+= -2;$(13_10)	else$(13_10)		x+= 2;$(13_10)	while(!place_meeting(x,y+sign(vsp),movingPlatform))$(13_10)	{	$(13_10)		y +=sign(vsp);$(13_10)	}$(13_10)	vsp = 0;$(13_10)}$(13_10)$(13_10)x+=hsp;$(13_10)y+=vsp;"
key_right = keyboard_check(vk_right);
key_left = -keyboard_check(vk_left);
key_jump = keyboard_check(vk_space);
key_sprint = keyboard_check(vk_shift);
key_dash = keyboard_check(vk_control);

move = key_left + key_right;
if(key_sprint)
	hsp = movespeed * move;
else if(dashMode == 0)
	hsp = (movespeed-10) * move;

if(key_dash && dashMode == 0)
{
    dashMode = 1;
	speedx = hsp;
	hsp += 20*move;
}
if(move > 0)
{
	if(dashMode && hsp > speedx-10 && hsp > (movespeed-10) * move)
		hsp += 3*move*-1;
	else if(dashMode && (hsp <= speedx-10 || hsp <= (movespeed-10) * move))
		dashMode = 0;
}
if(move < 0)
{
	if(dashMode && hsp < speedx+10 && hsp < (movespeed-10) * move)
		hsp += 3*move*-1;
	else if(dashMode && (hsp >= speedx+10 || hsp >= (movespeed-10) * move))
		dashMode = 0;
}


	

vsp = vsp + grav;

if(place_meeting(x,y+1,wall))
{
	firstJump = 0;
}

if((place_meeting(x,y+1,wall) || place_meeting(x,y+1,movingPlatform)) && key_jump)
{
	vsp = -18;
}
//wallJump
if(place_meeting(x+1,y,wall) || place_meeting(x-1,y,wall))
{
	if(key_jump && firstJump == 0)
	{
		vsp = -18;
		firstJump = 1;
	}
}

//horizontal collision
if(place_meeting(x+hsp,y,wall))
{
	while(!place_meeting(x+sign(hsp),y,wall))
	{
		x +=sign(hsp);
	}
	hsp = 0;
}
if(place_meeting(x+hsp,y,movingPlatform))
{
	while(!place_meeting(x+sign(hsp),y,movingPlatform))
	{
		x +=sign(hsp);
	}
	hsp = 0;
}
//vertical collision
if(place_meeting(x,y+vsp,wall))
{
	while(!place_meeting(x,y+sign(vsp),wall))
	{
		y +=sign(vsp);
	}
	vsp = 0;
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
}

x+=hsp;
y+=vsp;