/*
 * RC - Radio Communication v1.3
 * DayZ Epoch Script
 * by ilikepizza
 * 
 * Enables players to see each other on the Map/GPS.
 * The players have to carry a radio item ('ItemRadio') and need to be tagged both as friends.
 * 
 * Usage:
 * 	call compile preprocessFileLineNumbers "RC\init.sqf";
 * or
 * 	execVM "RC\init.sqf";
 * 
 * Script can be configured by editing RC\config.sqf.
 * 
 * Do NOT modify this file for simple use.
 */

//client side script, but works also in editor and singleplayer
if (!isServer or !isDedicated) then {
	[] spawn {
		//important variables, don't touch
		RC_friends = [];
        RC_vehicles = [];
		RC_index = 0;
        RC_gui_show = false;
        RC_gui_names = "";
        RC_updateLocked = false;
        
	    RC_3dNameVisibleArray = [];
	    for "_i" from 0 to 15 do {
	      	RC_3dNameVisibleArray set [_i, false];
	    };
        
        RC_2dLayer = 77;
        RC_3dLayer = 78;
		
		call compile preprocessFileLineNumbers "RC\config.sqf";
	    call compile preprocessFileLineNumbers "RC\config\checkConfig.sqf";
		call compile preprocessFileLineNumbers "RC\inc\functions.sqf";
        call compile preprocessFileLineNumbers "RC\src\setupGUI.sqf";
		call compile preprocessFileLineNumbers "RC\src\checkCondition.sqf";
	};
};
