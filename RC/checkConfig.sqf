/*
 * RC - Radio Communication v1.2
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

if (isNil "RC_unitMarkerSize") then {
  	RC_unitMarkerSize = 0.5;
    diag_log ("RC - Missing Config Value: RC_unitMarkerSize. Set to 0.5.");
};

if (isNil "RC_vehicleMarkerSize") then {
  	RC_vehicleMarkerSize = 1.0;
    diag_log ("RC - Missing Config Value: RC_vehicleMarkerSize. Set to 1.0.");
};

if (isNil "RC_markerColor") then {
  	RC_markerColor = "Default";
    diag_log ("RC - Missing Config Value: RC_markerColor. Set to 'ColorGreen'.");
};

if (isNil "RC_markerShowName") then {
  	RC_markerShowName = 0.5;
    diag_log ("RC - Missing Config Value: RC_markerShowName. Set to true.");
};

if (isNil "RC_unitMarkerType") then {
  	RC_unitMarkerType = "mil_start";
    diag_log ("RC - Missing Config Value: RC_unitMarkerType. Set to 'mil_start'.");
};

if (isNil "RC_vehicleMarkerType") then {
  	RC_vehicleMarkerType = "Car";
    diag_log ("RC - Missing Config Value: RC_vehicleMarkerType. Set to 'Car'.");
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

if (RC_unitMarkerSize < 0) then {
    RC_unitMarkerSize = 0;
    diag_log ("RC - Bad Config Value: RC_unitMarkerSize < 0. Set to 0.");
};

if (RC_vehicleMarkerSize < 0) then {
    RC_vehicleMarkerSize = 0;
    diag_log ("RC - Bad Config Value: RC_vehicleMarkerSize < 0. Set to 0.");
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
