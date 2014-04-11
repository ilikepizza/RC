/*
 * RC - Radio Communication v1.0
 * DayZ Epoch Script
 * by ilikepizza
 */
 
//check if variables are not defined, then define with default values
if (isNil "RC_updateInterval") then {
  	RC_updateInterval = 0.5;
    diag_log ("RC - Missing Config Value: RC_updateInterval. Set to 0.5.");
};

if (isNil "RC_addInterval") then {
  	RC_addInterval = 2;
    diag_log ("RC - Missing Config Value: RC_updateInterval. Set to 2.");
};

if (isNil "RC_markerSize") then {
  	RC_markerSize = 0.5;
    diag_log ("RC - Missing Config Value: RC_updateInterval. Set to 0.5.");
};

//check if variables were set with bad values
if (RC_updateInterval < 0) then {
    RC_updateInterval = 0;
    diag_log ("RC - Bad Config Value: RC_updateInterval < 0. Set to 0.");
};

if (RC_addInterval < 0) then {
    RC_addInterval = 0;
    diag_log ("RC - Bad Config Value: RC_addInterval < 0. Set to 0.");
};

if (RC_markerSize < 0) then {
    RC_markerSize = 0;
    diag_log ("RC - Bad Config Value: RC_markerSize < 0. Set to 0.");
};

