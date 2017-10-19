/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 2E5E22AB
/// @DnDArgument : "code" "if(player.move < 0)$(13_10)	hsp=1;$(13_10)if(player.move > 0)$(13_10)	hsp=-1;$(13_10)if(player.move == 0 || player.hittingWall == 1)$(13_10)	hsp = 0;$(13_10)x+=hsp;"
if(player.move < 0)
	hsp=1;
if(player.move > 0)
	hsp=-1;
if(player.move == 0 || player.hittingWall == 1)
	hsp = 0;
x+=hsp;