/*
 * RC - Radio Communication v1.1
 * DayZ Epoch Script
 * by ilikepizza
 */

// thread for checking if new players join the radio channel
// and if local player meet conditions
[] spawn {
	while {sleep RC_addInterval; true} do {
        call RC_removeMarkers;
        
        //check if player is able to communicate
        _hasRadio = player call RC_hasRadio;
        if (_hasRadio) then {
	        //check if other players are able to communicate with the player
	    	{
	            //don't add own player
		        if (player != _x) then {
	                if (_x call RC_hasRadio && _x call RC_isFriend) then {
		            	_x call RC_addUnitCommunication;
	                };
		        };
		    } count allUnits;
	        
            // start thread for markers if not already running
            if (isNil "RC_markerUpdateScript") then {
                RC_markerUpdateScript = [] spawn RC_updateMarkers;
            };
		} else {
        	// stop thread for marker update if not already done
            if (!(isNil "RC_markerUpdateScript")) then {
            	terminate RC_markerUpdateScript;
                RC_markerUpdateScript = nil;
            };
        };
    };
};
