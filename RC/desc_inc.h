// RC - Radio Communication v1.3

class RadioGUI
{
	idd = -1;
	duration = 999999;
	fadein = 0;
	fadeout = 1;
	onLoad = "(uiNamespace setVariable ['RC_2dDisplay', (_this select 0)])";

	class controls
	{
		class Symbol
		{
			idc = 0;
			type = 0;
			style = 2096; // texture (48) + original aspect ratio (2048)
			//counting in multi-monitor setup
			x = safeZoneXAbs;
			y = safeZoneY + safeZoneH * 0.1;
			w = 0.07;
			h = safeZoneH * 0.1;
			font = "EtelkaNarrowMediumPro";
			sizeEx = 0.1;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			text = "";
			lineSpacing = 1; //required for multi-line style
		};

		class Names
		{
			idc = 1;
			type = 0;
			style = 528; //multiline text (16) + no border (512)
			//counting in multi-monitor setup
			x = safeZoneXAbs;
			y = safeZoneY + safeZoneH * 0.2;
			w = -safeZoneX + 0.1;
			h = safeZoneH * 0.6;
			font = "EtelkaNarrowMediumPro";
			sizeEx = 0.03;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			text = "";
			lineSpacing = 1; //required for multi-line style
			shadow = 2;
		};
	};
};

class Radio3D
{
	idd = 4444;
	duration = 999999;
	fadein = 0;
	fadeout = 1;
	onLoad = "(uiNamespace setVariable ['RC_3dDisplay', (_this select 0)])";

	class Rsc3DName
	{
		idc = -1;
		type = 13;  // defined constant
		style = 0;  // defined constant
		colorBackground[] = { 1, 1, 1, 0};
		x = safeZoneXAbs + 0.001;
		y = safeZoneY + 0.001;
		w = safeZoneW * 0.35;
		h = 0.2;
		size = 0.07;
		text = "";
		class Attributes {
			font = "TahomaB";
			//color = "#20ad2d";
			align = "center";
			shadow = '2';
			shadowColor = "#0000ff";
			size = "1";
		};
	};

	class controls
	{
		class Name0 : Rsc3DName
		{
			idc = 0;
		};
		class Name1 : Rsc3DName
		{
			idc = 1;
		};
		class Name2 : Rsc3DName
		{
			idc = 2;
		};
		class Name3 : Rsc3DName
		{
			idc = 3;
		};
		class Name4 : Rsc3DName
		{
			idc = 4;
		};
		class Name5 : Rsc3DName
		{
			idc = 5;
		};
		class Name6 : Rsc3DName
		{
			idc = 6;
		};
		class Name7 : Rsc3DName
		{
			idc = 7;
		};
		class Name8 : Rsc3DName
		{
			idc = 8;
		};
		class Name9 : Rsc3DName
		{
			idc = 9;
		};
		class Name10 : Rsc3DName
		{
			idc = 10;
		};
		class Name11 : Rsc3DName
		{
			idc = 11;
		};
		class Name12 : Rsc3DName
		{
			idc = 12;
		};
		class Name13 : Rsc3DName
		{
			idc = 13;
		};
		class Name14 : Rsc3DName
		{
			idc = 14;
		};
		class Name15 : Rsc3DName
		{
			idc = 15;
		};
	};
};
