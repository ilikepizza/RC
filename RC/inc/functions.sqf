/*
 * RC - Radio Communication v1.3
 * DayZ Epoch Script
 * by ilikepizza
 */
 
// Define complex functions
 
RC_updateMarkers = compile preprocessFileLineNumbers "RC\src\updateMarkers.sqf";
RC_update3dNames = compile preprocessFileLineNumbers "RC\src\update3DNames.sqf";

// Define simple functions

call compile preprocessFileLineNumbers "RC\inc\math.sqf";
call compile preprocessFileLineNumbers "RC\inc\system.sqf";
