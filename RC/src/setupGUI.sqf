/*
 * RC - Radio Communication v1.3
 * DayZ Epoch Script
 * by ilikepizza
 */

disableSerialization;

sleep 2;

RC_2dLayer cutRsc ["RadioGUI","PLAIN"];

RC_3dLayer cutRsc ["Radio3D","PLAIN"];

sleep 2;

// setup texture path
_display = uiNamespace getVariable "RC_2dDisplay";

_ctrl = _display displayCtrl 0;
_ctrl ctrlSetText RC_RadioTexPath;
_ctrl ctrlShow false;

_ctrl = _display displayCtrl 1;
_ctrl ctrlSetTextColor RC_guiNameColor;
_ctrl ctrlShow false;

_display = uiNamespace getVariable "RC_3dDisplay";

for "_i" from 0 to 15 do {
	_ctrl = _display displayCtrl _i;
    _ctrl ctrlShow false;
};
