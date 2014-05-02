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

if (isNil "RC_3DSmoothMovement") then {
  	RC_3DSmoothMovement = true;
    diag_log ("RC - Missing Config Value: RC_3DSmoothMovement. Set to true.");
};

if (isNil "RC_3DSmoothMoveSpeed") then {
  	RC_3DSmoothMoveSpeed = 0.2;
    diag_log ("RC - Missing Config Value: RC_3DSmoothMoveSpeed. Set to 0.2.");
};

if (isNil "RC_3DNameSizeMin") then {
  	RC_3DNameSizeMin = 0.3;
    diag_log ("RC - Missing Config Value: RC_3DNameSizeMin. Set to 0.3.");
};

if (isNil "RC_3DRadiusEnable") then {
  	RC_3DRadiusEnable = true;
    diag_log ("RC - Missing Config Value: RC_3DRadiusEnable. Set to true.");
};

if (isNil "RC_3DRadius") then {
  	RC_3DRadius = 1000;
    diag_log ("RC - Missing Config Value: RC_3DRadius. Set to 1000.");
};

if (isNil "RC_3DShowCircle") then {
  	RC_3DShowCircle = true;
    diag_log ("RC - Missing Config Value: RC_3DShowCircle. Set to true.");
};

if (isNil "RC_3DShowRadioSymbol") then {
  	RC_3DShowRadioSymbol = true;
    diag_log ("RC - Missing Config Value: RC_3DShowRadioSymbol. Set to true.");
};

if (isNil "RC_3DNamesRT") then {
  	RC_3DNamesRT = false;
    diag_log ("RC - Missing Config Value: RC_3DNamesRT. Set to false.");
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

if (RC_3DSmoothMoveSpeed < 0) then {
    RC_3DSmoothMoveSpeed = 0;
    diag_log ("RC - Bad Config Value: RC_3DSmoothMoveSpeed < 0. Set to 0.");
};

if (RC_3DNameSizeMin < 0) then {
    RC_3DNameSizeMin = 0;
    diag_log ("RC - Bad Config Value: RC_3DNameSizeMin < 0. Set to 0.");
};

if (RC_3DNameSizeMin > 1) then {
    RC_3DNameSizeMin = 1;
    diag_log ("RC - Bad Config Value: RC_3DNameSizeMin > 1. Set to 1.");
};

if (RC_3DRadius < 0) then {
    RC_3DRadius = 0;
    diag_log ("RC - Bad Config Value: RC_3DNameSizeMin < 0. Set to 0. This practically disables 3D names.");
};

"config\colors.sqf" call RC_fnc_call;

if (!(RC_markerColor in RC_arma_colors)) then {
    RC_markerColor = "ColorGreen";
    diag_log ("RC - Bad Config Value: RC_markerColor invalid. Set to 'ColorGreen'.");
};
