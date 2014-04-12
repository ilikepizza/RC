/*
 * RC - Radio Communication v1.1
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
    diag_log ("RC - Missing Config Value: RC_addInterval. Set to 2.");
};

if (isNil "RC_markerSize") then {
  	RC_markerSize = 0.5;
    diag_log ("RC - Missing Config Value: RC_markerSize. Set to 0.5.");
};

if (isNil "RC_markerColor") then {
  	RC_markerSize = "Default";
    diag_log ("RC - Missing Config Value: RC_markerColor. Set to 'ColorGreen'.");
};

if (isNil "RC_markerShowName") then {
  	RC_markerSize = 0.5;
    diag_log ("RC - Missing Config Value: RC_markerShowName. Set to true.");
};

if (isNil "RC_markerType") then {
  	RC_markerSize = "mil_start";
    diag_log ("RC - Missing Config Value: RC_markerType. Set to 'mil_start'.");
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

call compile preprocessFileLineNumbers "RC\colors.sqf";

if (!(RC_markerColor in RC_arma_colors)) then {
    RC_markerColor = "ColorGreen";
    diag_log ("RC - Bad Config Value: RC_markerColor invalid. Set to 'ColorGreen'.");
};

if (RC_markerShowName && (!RC_markerShowName)) then {
    RC_markerShowName = true;
    diag_log ("RC - Bad Config Value: RC_markerShowName is not Boolean. Set to true.");
};
