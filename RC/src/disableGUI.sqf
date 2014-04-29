/*
 * RC - Radio Communication v1.3
 * DayZ Epoch Script
 * by ilikepizza
 */
 
disableSerialization;

// Make 2D gui invisible
_display = uiNamespace getVariable "RC_2dDisplay";
for "_i" from 0 to 1 do {
	_ctrl = _display displayCtrl _i;
    _ctrl ctrlShow false;
};

// Make 3D gui invisible
_display = uiNamespace getVariable "RC_3dDisplay";

for "_i" from 0 to 15 do {
	_ctrl = _display displayCtrl _i;
    _ctrl ctrlShow false;
};