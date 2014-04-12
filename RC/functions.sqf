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
RC_addMarker = {
    _unit = _this select 0;
    _index = _this select 1;
    
    _pos = getPosASL _unit;
    _pos resize 2;
    
    _marker = createMarkerLocal [_index, _pos];
    _index setMarkerTypeLocal RC_markerType;
    if (RC_markerShowName) then {
    	_index setMarkerTextLocal name _unit;
    };
    _index setMarkerColorLocal RC_markerColor;
    _index setMarkerAlphaLocal RC_markerAlpha;
    _index setMarkerDirLocal getDir _unit;
    _index setMarkerSizeLocal [RC_markerSize,RC_markerSize];
    _index setMarkerPosLocal _pos;
};

/* Adds a unit to the radio channel for being given a marker for the executing player.
 * Usage:
 *	unit call RC_addUnitCommunication;
 *  Return: none
 */
RC_addUnitCommunication = {
	_unit = _this;
    
    _isDouble = ({
        _unit_listed = _x select 1;
        _unit_listed == _unit;
    } count RC_friends) > 0;
    
    // if not already listed
    if (!_isDouble) then {
        _name = format ["%1", RC_index];
    	//[_unit, _name] call RC_addMarker;

		//remember unit and marker name for updating
        RC_friends = RC_friends + [[_name, _unit]];
        RC_index = RC_index + 1;
    };
};

RC_removeMarkers = {
    //remove previous markers
    {
        _name = _x select 0;
    	_unit = _x select 1;
        
        deleteMarkerLocal _name;
    } count RC_friends;
    RC_friends = [];
    RC_index = 0;
};