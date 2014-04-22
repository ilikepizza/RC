/*
 * RC - Radio Communication v1.2
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

call compile preprocessFileLineNumbers "RC\debug\init.sqf";

//client side script, but works also in editor and singleplayer
if (!isServer or !isDedicated) then {
	[] spawn {
        dbg_initStarted = true;
        diag_log "RC Script is Running.";
		//important variables, don't touch
		RC_friends = [];
        RC_vehicles = [];
		RC_index = 0;
        RC_gui_show = false;
        RC_gui_names = "";
        RC_updateLocked = false;
		
		call compile preprocessFileLineNumbers "RC\config.sqf";
	    call compile preprocessFileLineNumbers "RC\checkConfig.sqf";
		call compile preprocessFileLineNumbers "RC\functions.sqf";
		call compile preprocessFileLineNumbers "RC\checkCondition.sqf";
	};
};

call compile preprocessFileLineNumbers "RC\debug\output.sqf";
