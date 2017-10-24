/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 7DA574FB
/// @DnDArgument : "code" "var(switch_key) = keyboard_check(vk_tab)$(13_10)$(13_10)if(switch_key)$(13_10){$(13_10)	room_goto(xxx)$(13_10)}"
var(switch_key) = keyboard_check(vk_tab)

if(switch_key)
{
	room_goto(xxx)
}