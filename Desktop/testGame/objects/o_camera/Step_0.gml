/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 4ABB9E71
/// @DnDArgument : "code" "if(instance_exists(player))$(13_10){$(13_10)	xTo = follow.x;$(13_10)	yTo = follow.y;$(13_10)}$(13_10)$(13_10)x+= (xTo - x)/10;$(13_10)y+= (yTo - y)/10;$(13_10)$(13_10)camera_set_view_pos(cam, x - view_w_half, y - view_h_half);$(13_10)$(13_10)var(switch_key) = keyboard_check(vk_tab)$(13_10)$(13_10)if(switch_key)$(13_10)	room_goto(room1)"
if(instance_exists(player))
{
	xTo = follow.x;
	yTo = follow.y;
}

x+= (xTo - x)/10;
y+= (yTo - y)/10;

camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

var(switch_key) = keyboard_check(vk_tab)

if(switch_key)
	room_goto(room1)