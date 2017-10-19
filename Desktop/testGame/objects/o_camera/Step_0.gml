/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 4ABB9E71
/// @DnDArgument : "code" "if(instance_exists(player))$(13_10){$(13_10)	xTo = follow.x;$(13_10)	yTo = follow.y;$(13_10)}$(13_10)$(13_10)x+= (xTo - x)/10;$(13_10)y+= (yTo - y)/10;$(13_10)$(13_10)camera_set_view_pos(cam, x - view_w_half, y - view_h_half);"
if(instance_exists(player))
{
	xTo = follow.x;
	yTo = follow.y;
}

x+= (xTo - x)/10;
y+= (yTo - y)/10;

camera_set_view_pos(cam, x - view_w_half, y - view_h_half);