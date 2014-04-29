/*
 * RC - Radio Communication v1.3
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

if (isNil "RC_3DNames") then {
  	RC_3DNames = true;
    diag_log ("RC - Missing Config Value: RC_3DNames. Set to true.");
};

if (isNil "RC_3dInstantMove") then {
  	RC_3dInstantMove = false;
    diag_log ("RC - Missing Config Value: RC_3dInstantMove. Set to false.");
};

if (isNil "RC_3dMoveSpeed") then {
  	RC_3dMoveSpeed = 0.2;
    diag_log ("RC - Missing Config Value: RC_3dMoveSpeed. Set to 0.2.");
};

if (isNil "RC_minNameSize") then {
  	RC_minNameSize = 0.3;
    diag_log ("RC - Missing Config Value: RC_minNameSize. Set to 0.3.");
};

if (isNil "RC_showCircle") then {
  	RC_showCircle = true;
    diag_log ("RC - Missing Config Value: RC_showCircle. Set to true.");
};

if (isNil "RC_showRadioSymbol") then {
  	RC_showRadioSymbol = true;
    diag_log ("RC - Missing Config Value: RC_showRadioSymbol. Set to true.");
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

if (RC_3dMoveSpeed < 0) then {
    RC_3dMoveSpeed = 0;
    diag_log ("RC - Bad Config Value: RC_3dMoveSpeed < 0. Set to 0.");
};

if (RC_minNameSize < 0) then {
    RC_minNameSize = 0;
    diag_log ("RC - Bad Config Value: RC_minNameSize < 0. Set to 0.");
};

if (RC_minNameSize > 1) then {
    RC_minNameSize = 1;
    diag_log ("RC - Bad Config Value: RC_minNameSize > 1. Set to 1.");
};

"config\colors.sqf" call RC_fnc_call;

if (!(RC_markerColor in RC_arma_colors)) then {
    RC_markerColor = "ColorGreen";
    diag_log ("RC - Bad Config Value: RC_markerColor invalid. Set to 'ColorGreen'.");
};
