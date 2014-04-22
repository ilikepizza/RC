dbg_finished = false;
dbg_initStarted = false;
dbg_timeCancel = false;
dbg_finishedDebugInit = false;

dbg_anyErrors = false;

dbg_serverExp = ! isServer;
dbg_dedicatedExp = ! isDedicated;
dbg_initConditionExp = !isServer or !isDedicated;

dbg_doesSpawnWork = false;
[] spawn {
  	dbg_doesSpawnWork = true;
};

dbg_doesCallWork = false;
call {
  	dbg_doesCallWork = true;
};

dbg_doesCountWork = false;
dbg_counted = {
    true
} count [1,2,3];
if ( dbg_counted == 3) then {
    dbg_doesCountWork = true;
};

dbg_doesSleepWork = false;
[] spawn {
    dbg_time = time;
	sleep 1;
    if (time > dbg_time + 0.5) then {
        dbg_doesSleepWork = true;
    };
};

// functions variables
dbg_hadEverRadio = false;
dbg_fncCallHasRadio = false;
dbg_hadEverFriend = false;
dbg_fncCallIsFriend = false;
dbg_fncCallAddUnitMarker = false;
dbg_fncCallAddUnitCommunication = false;
dbg_fncCallRemoveMarkers = false;
dbg_fncCallOnRadioGUI = false;

//update vars
dbg_updatedOnce = false;
dbg_updatedOften = false;

//check vars
dbg_checkedOnce = false;
dbg_checkedOften = false;

//Output array
output = [];

output = output + [["dbg_initStarted", true]];
output = output + [["dbg_timeCancel", false]];

output = output + [["dbg_serverExp", true]];
output = output + [["dbg_dedicatedExp", true]];
output = output + [["dbg_initConditionExp", true]];

//function checking variables
output = output + [["dbg_doesSpawnWork", true]];
output = output + [["dbg_doesCallWork", true]];
output = output + [["dbg_doesCountWork", true]];

//RC function checking variables
output = output + [["dbg_hadEverRadio", true]];
output = output + [["dbg_fncCallHasRadio", true]];
output = output + [["dbg_hadEverFriend", true]];
output = output + [["dbg_fncCallIsFriend", true]];
output = output + [["dbg_fncCallAddUnitMarker", true]];
output = output + [["dbg_fncCallAddUnitCommunication", true]];
output = output + [["dbg_fncCallRemoveMarkers", true]];
output = output + [["dbg_fncCallOnRadioGUI", true]];

//RC update function variables
output = output + [["dbg_updatedOnce", true]];
output = output + [["dbg_updatedOften", true]];

//RC check function vars
output = output + [["dbg_checkedOnce", true]];
output = output + [["dbg_checkedOften", true]];

sleep 5;

dbg_finishedDebugInit = true;
