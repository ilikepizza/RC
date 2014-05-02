/*
 * RC - Radio Communication v1.3
 * DayZ Epoch Script
 * by ilikepizza
 */
 
// Define complex functions

RC_update = "src\update.sqf" call RC_fnc_comp;
RC_update2dGUI = "src\update2DNames.sqf" call RC_fnc_comp;
RC_update3dGUI = "src\update3DNames.sqf" call RC_fnc_comp;
RC_updateRT3dGUI = "src\update3DNamesRT.sqf" call RC_fnc_comp;
RC_disableGUI = "src\disableGUI.sqf" call RC_fnc_comp;

// Define simple functions

"inc\math.sqf" call RC_fnc_call;
"inc\system.sqf" call RC_fnc_call;
