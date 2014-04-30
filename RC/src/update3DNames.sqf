/*
 * RC - Radio Communication v1.3
 * DayZ Epoch Script
 * by ilikepizza
 */
 
disableSerialization;

private ["_display"];
_display = uiNamespace getVariable "RC_3dDisplay";
_unitCount = count RC_friends;

_currentDir = getDir player;
_difference = [_currentDir, RC_playersLastDir] call RC_math_absDiff;

// if player rotated, move instantly
_instantMove = RC_3dInstantMove;
if (_difference > 0.1) then {
    _instantMove = true;
};

RC_playersLastDir = _currentDir;

for "_i" from 0 to 15 do {
	_ctrl = _display displayCtrl _i;
    
    //diag_log format ["_unitCount=%1", _unitCount];
    if (_unitCount > _i && (!visibleMap)) then {
        //private ["_unit"];
        _unit = _i call RC_fnc_getRCUnit;
        _screenPos = (worldToScreen getPos _unit);
        
        // is unit even drawn?
	    if ( count _screenPos < 2) then {
            // disable the name gui control
            _ctrl ctrlShow false;
        	RC_3dNameVisibleArray set [_i, false];
	    } else {
            _unitName = name _unit;
            
            _distance = player distance _unit;
			_size = (1-(floor(_distance/5)*0.1)) max RC_minNameSize; // 1 at <5m, 0.5 at > 25m, 0.1 loss per 5m
		    
		    _colorParam = "color='#209d2d'";
		    _sizeParam = format ["size='%1'", _size];
	        
	        _textParams = " shadow='2' shadowColor='#ff0000' align='center' ";
		    //_textParams = _textParams + " underline='true'";
	        
		    _string = format ["<img %2 %5/><br/><img %2 %6/><t %2 %3 %4>%1</t>", _unitName, _sizeParam, _colorParam, _textParams, RC_CircleTexParam, RC_RadioTexParam];
		    _ctrl ctrlSetStructuredText (parseText _string);
		    
		    //get position values
		    _x = _positionGUI select 0;
		    _y = _positionGUI select 1;
            
            //calculate new gui position
            _positionGUI = ctrlPosition _ctrl;
            
	        _w = _positionGUI select 2;
	        _h = _positionGUI select 3;
	        _x = (_screenPos select 0) - (_w/2);
	    	_y = (_screenPos select 1) - (_h/4) * _size;
	    
		    //set new position values
		    _ctrl ctrlSetPosition [_x, _y];
            
	        if (_instantMove) then {
	            _ctrl ctrlCommit 0;
	        } else {
                // if was visible before, then move smoothly
	            if (RC_3dNameVisibleArray select _i) then {
	            	_ctrl ctrlCommit RC_3dMoveSpeed;
	            } else {
	                _ctrl ctrlCommit 0;
	            };
	        };
	        
	        _ctrl ctrlShow true;
		    RC_3dNameVisibleArray set [_i, true];
        };
    } else {
		_ctrl ctrlShow false;
        RC_3dNameVisibleArray set [_i, false];
    };
};
