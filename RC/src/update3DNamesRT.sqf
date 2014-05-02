disableSerialization;

private ["_display"];
_display = uiNamespace getVariable "RC_3dDisplay";

_ctrls = [];
for "_i" from 0 to 15 do {
    _ctrls set [_i, _display displayCtrl _i];
};

waitUntil {
    waitUntil {not RC_updateLocked};
    RC_updateLocked = true;
    
    _unitCount = count RC_friends;
    
    for "_i" from 0 to 15 do {
		_ctrl = _ctrls select _i;
	    _hide = true;
        
	    //diag_log format ["_unitCount=%1", _unitCount];
	    if (_unitCount > _i && (!visibleMap)) then {
	        _unit = _i call RC_fnc_getRCUnit;
	        _screenPos = (worldToScreen getPos _unit);
	        
	        // is unit even drawn?
		    if ( count _screenPos > 1) then {
	            _distance = player distance _unit;
                if (RC_3DRadius > _distance) then {
					_size = (1-(floor(_distance/5)*0.1)) max RC_3DNameSizeMin; // 1 at <5m, 0.5 at > 25m, 0.1 loss per 5m
				    
				    _colorParam = "color='#209d2d'";
				    _sizeParam = format ["size='%1'", _size];
			        
			        _textParams = " shadow='2' shadowColor='#ff0000' align='center' ";
				    _unitName = name _unit;
			        
				    _string = format [RC_3dText, _unitName, _sizeParam, _colorParam, _textParams, RC_CircleTexParam, RC_RadioTexParam];
				    _ctrl ctrlSetStructuredText (parseText _string);
				    
		            //calculate new gui position
		            _positionGUI = ctrlPosition _ctrl;
		            
			        _w = _positionGUI select 2;
			        _h = _positionGUI select 3;
			        _x = (_screenPos select 0) - (_w/2);
			    	_y = (_screenPos select 1) - (_h/4) * _size;
			    
				    //set new position values
				    _ctrl ctrlSetPosition [_x, _y];
		            _ctrl ctrlCommit 0;
			        
			        _ctrl ctrlShow true;
				    RC_3dNameVisibleArray set [_i, true];
	                _hide = false;
                };
	        };
	    };
        if (_hide) then {
	        _ctrl ctrlShow false;
	        RC_3dNameVisibleArray set [_i, false];
	    };
	};
    RC_updateLocked = false;
    false
};