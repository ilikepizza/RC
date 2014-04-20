// RC - Radio Communication v1.2
class RadioGUI
{
	idd = -1;
	duration = "(missionNamespace getVariable 'RC_addInterval') + (missionNamespace getVariable 'RC_updateInterval')";
	fadein = 0;
	fadeout = 1;
	onLoad = "_this call onRadioGUI"; //UI event handler

	class controls
	{
		class Symbol
		{
			idc = -1;
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
			text ="RC\radio_symbol.paa";
			lineSpacing = 1; //required for multi-line style
		};

		class Names
		{
			idc = -2;
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
