/*
 * RC - Radio Communication v1.1
 * DayZ Epoch Script
 * by ilikepizza
 */
 
RC_updateMarkers = compile preprocessFileLineNumbers "RC\updateMarkers.sqf";
 
/* Checks wether the given unit has a radio.
 * Usage:
 * 	unit call RC_hasRadio;
 *  Result: Boolean
 */
RC_hasRadio = {
    _ret = "ItemRadio" in weapons _this;
    //{_x == "ItemRadio"} count (weapons _this) > 0;
    _ret
};

/* Checks wether the given unit are tagged as friends with the player. (DayZ Epoch)
 * Usage:
 * 	unit call RC_hasRadio;
 *  Result: Boolean
 */
RC_isFriend = {
    _isFriendly = false;
  	_target = _this;

	_player_cID = player getVariable ["CharacterID", "0"];

    //not friendly if something went wrong
    if (_player_cID == "0") exitWith {_isFriendly};
    
	_rfriendlies = _target getVariable ["friendlies", []];
    
    if (_player_cID in _rfriendlies) then {
        _isFriendly = true;
    };
    _isFriendly
};

/* Adds a marker at the given units position.
 * Usage:
 *	[unit, markerName] call RC_addMarker;
 *  Return: none
 */
RC_addUnitMarker = {
    _index = _this select 0;
    _unit = _this select 1;
    
    _pos = getPosASL _unit;
    _pos resize 2;
    
    _marker = createMarkerLocal [_index, _pos];
    _index setMarkerTypeLocal RC_unitMarkerType;
    if (RC_markerShowName) then {
    	_index setMarkerTextLocal name _unit;
    };
    _index setMarkerColorLocal RC_markerColor;
    _index setMarkerAlphaLocal RC_markerAlpha;
    _index setMarkerDirLocal getDir vehicle _unit;
    _index setMarkerSizeLocal [RC_unitMarkerSize, RC_unitMarkerSize];
    _index setMarkerPosLocal _pos;
};

/* Adds a marker at the given vehicles position.
 * Usage:
 *	[_vehicle, markerName] call RC_addMarker;
 *  Return: none
 */
RC_addVehicleMarker = {
    _index = _this select 0;
    _vehicle = _this select 1;
    
    _pos = getPosASL _vehicle;
    _pos resize 2;
    
    _markerVehicle = createMarkerLocal [_index, _pos];
    _index setMarkerTypeLocal RC_vehicleMarkerType;
    //_indexVehicle setMarkerTextLocal "";
    _index setMarkerColorLocal RC_markerColor;
    _index setMarkerAlphaLocal RC_markerAlpha;
    _index setMarkerDirLocal getDir _vehicle;
    _index setMarkerSizeLocal [RC_vehicleMarkerSize, RC_vehicleMarkerSize];
    _index setMarkerPosLocal _pos;
};

/* Adds a unit to the radio channel for being given a marker for the executing player.
 * Usage:
 *	unit call RC_addUnitCommunication;
 *  Return: none
 */
RC_addUnitCommunication = {
	_unit = _this;
    _name = format ["%1", RC_index];
    
	//remember unit and marker name for updating
    RC_friends set [count RC_friends, [_name, _unit]];
    RC_gui_names = RC_gui_names + name _unit + "\n";
    
    _vehicle = vehicle _unit;
    _inVehicle = _vehicle != _unit;
    
    if (_inVehicle) then {
    	RC_vehicles set [count RC_vehicles, [_name+"Veh", _vehicle]];
    };
    
    RC_index = RC_index + 1;
};

/*
 * Removes all set markers.
 * Usage:
 *  call RC_removeMarkers;
 *  Return: none
 */
RC_removeMarkers = {
    //remove previous markers
    {
        deleteMarkerLocal (_x select 0);
        true
    } count RC_friends;
    {
        deleteMarkerLocal (_x select 0);
        true
    } count RC_vehicles;
    RC_friends = [];
    RC_vehicles = [];
    RC_index = 0;
    RC_gui_names = "";
};

/*
 * Callback function from description.ext by Radio GUI.
 * Params:
 * 	_this = [RadioGUI]
 */
onRadioGUI = {
	private ["_display"];
    _display = _this select 0;
    
    _logo_idc = -1;
    _logo_ctrl = _display displayCtrl _logo_idc;
    _names_idc = -2;
    _names_ctrl = _display displayCtrl _names_idc;
    
    _names_ctrl ctrlSetText RC_gui_names;
    //ctrlSetStructuredText
    _names_ctrl ctrlSetTextColor RC_guiNameColor;
    _names_ctrl ctrlCommit 1;
};
