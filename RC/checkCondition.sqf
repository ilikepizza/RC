/*
 * RC - Radio Communication v1.1
 * DayZ Epoch Script
 * by ilikepizza
 */

// thread for checking if new players join the radio channel
// and if local player meet conditions
[] spawn {
	while {sleep RC_addInterval; true} do {
        waitUntil {not RC_updateLocked};
        RC_updateLocked = true;
        
        call RC_removeMarkers;
        
        //check if player is able to communicate
        _hasRadio = player call RC_hasRadio;
        if (_hasRadio) then {
	        //check if other players are able to communicate with the player
	    	{
	            //don't add own player
		        if (player != _x) then {
	                if (_x call RC_hasRadio && _x call RC_isFriend && alive _x) then {
		            	_x call RC_addUnitCommunication;
	                };
		        };
		    } count allUnits;
	        
            // start thread for markers if not already running
            if (isNil "RC_markerUpdateScript") then {
                RC_markerUpdateScript = [] spawn RC_updateMarkers;
            };
            if (RC_gui_en) then {
            	RC_gui_show = true;
            };
		} else {
        	// stop thread for marker update if not already done
            if (!(isNil "RC_markerUpdateScript")) then {
            	terminate RC_markerUpdateScript;
                RC_markerUpdateScript = nil;
            };
            if (RC_gui_en) then {
            	RC_gui_show = false;
            };
        };
        RC_updateLocked = false;
        
        diag_log "checkCondition";
    };
};
