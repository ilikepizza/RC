[] spawn {
    diag_log "Waiting ...";
    dbg_time = time;
    waitUntil {
        sleep 1; 
        if (dbg_checkedOften and dbg_updatedOften and dbg_finishedDebugInit) then {
            dbg_finished = true;
        };
        if (dbg_time + 300 < time) then {dbg_timeCancel = true;};
        dbg_finished or dbg_timeCancel
    };
    
    diag_log "Checking RC Script ...";
    
    {
        _varName = _x select 0;
        _varAssertVal = _x select 1;
        _varVal = missionNamespace getVariable _varName;
        
        if ([_varVal, _varAssertVal] call boolsUnequal) then {
            diag_log format ["  RC Debug:%1 assert failed. Expected %2, but was %3",_varName, _varAssertVal, _varVal];
        	dbg_anyErrors = true;
        };
        
	    true
	} count output;
    
    if (!dbg_anyErrors) then {
    	diag_log "      RC Debug: Everything is working fine.";
    };
        
    diag_log "... finished checking RC Script.";
};
