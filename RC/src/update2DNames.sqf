/*
 * RC - Radio Communication v1.3
 * DayZ Epoch Script
 * by ilikepizza
 */
 
disableSerialization;

private ["_display"];
_display = uiNamespace getVariable "RC_2dDisplay";

_logo_ctrl = _display displayCtrl 0;
_logo_ctrl ctrlShow true;

_names_ctrl = _display displayCtrl 1;
_names_ctrl ctrlSetText RC_gui_names;
_names_ctrl ctrlSetTextColor RC_guiNameColor;
_names_ctrl ctrlShow true;
