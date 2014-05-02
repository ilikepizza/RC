/*
 * RC - Radio Communication v1.3
 * DayZ Epoch Script
 * by ilikepizza
 */

//important variables, don't touch
RC_friends = [];
RC_vehicles = [];
RC_index = 0;
RC_gui_names = "";
RC_updateLocked = false;

RC_3dNameVisibleArray = [];
for "_i" from 0 to 15 do {
  	RC_3dNameVisibleArray set [_i, false];
};

RC_2dLayer = 77;
RC_3dLayer = 78;

//setup 3d structured text
RC_3dText = "";
if (RC_showCircle) then {
    RC_3dText = RC_3dText + "<img %2 %5/><br/>";
};
if (RC_showRadioSymbol) then {
    RC_3dText = RC_3dText + "<img %2 %6/>";
};
RC_3dText = RC_3dText + "<t %2 %3 %4>%1</t>";

//setup 3d variables
if (!RC_3DNames) then {
    RC_3DNamesRT = false;
};

//setup rsrc paths
RC_RadioTexPath = "rsrc\radio_symbol.paa" call RC_fnc_getPath;
RC_CircleTexPath = "rsrc\circle.paa" call RC_fnc_getPath;

RC_RadioTexParam = format ["image='%1'", RC_RadioTexPath];
RC_CircleTexParam = format ["image='%1'", RC_CircleTexPath];