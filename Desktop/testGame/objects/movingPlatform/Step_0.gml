/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 5E69B1A8
/// @DnDArgument : "code" "if(bool == 0)$(13_10){$(13_10)	x+= -2;$(13_10)	i+=1;$(13_10)}$(13_10)$(13_10)if(bool == 1)$(13_10){$(13_10)	x+=2;$(13_10)	i+=1;$(13_10)}$(13_10)$(13_10)if(i > 200)$(13_10){$(13_10)	i = 0;$(13_10)	if(bool == 1)$(13_10)		bool = 0;$(13_10)	else if(bool == 0)$(13_10)		bool = 1;$(13_10)}"
if(bool == 0)
{
	x+= -2;
	i+=1;
}

if(bool == 1)
{
	x+=2;
	i+=1;
}

if(i > 200)
{
	i = 0;
	if(bool == 1)
		bool = 0;
	else if(bool == 0)
		bool = 1;
}