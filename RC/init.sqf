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
 * Script directory can be moved easily by changing the RC_path variable below to the correct path.
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
        RC_gui_names = "";
        RC_updateLocked = false;
        
	    RC_3dNameVisibleArray = [];
	    for "_i" from 0 to 15 do {
	      	RC_3dNameVisibleArray set [_i, false];
	    };
        
        RC_2dLayer = 77;
        RC_3dLayer = 78;
        
        // Changes the default path for script search of the internal RC scripts.
		// Change this path if you want to place the script directory somewhere else than "missionfile\RC".
		// Example: For "missionfile\Custom\Scripts\RC" Directory set RC_path = "Custom\Scripts\RC"
		// If you have renamed the main directory RC of the script, you can change the name here too.
		RC_path = "RC";
        
        // get the correct path for script files of this script
        RC_fnc_getPath = {
          	RC_path + "\" + _this
        };
        
        RC_fnc_comp = {
            compile preprocessFileLineNumbers (_this call RC_fnc_getPath);
        };
        
        //call and compile script files of RC script
        RC_fnc_call = {
            call (_this call RC_fnc_comp);
        };
        
        RC_RadioTexPath = "rsrc\radio_symbol.paa" call RC_fnc_getPath;
        RC_CircleTexPath = "rsrc\circle.paa" call RC_fnc_getPath;
        
        RC_RadioTexParam = format ["image='%1'", RC_RadioTexPath];
        RC_CircleTexParam = format ["image='%1'", RC_CircleTexPath];
        
        "config.sqf" call RC_fnc_call;
        "config\checkConfig.sqf" call RC_fnc_call;
        "inc\functions.sqf" call RC_fnc_call;
        "src\setupGUI.sqf" call RC_fnc_call;
        "src\checkCondition.sqf" call RC_fnc_call;
	};
};
