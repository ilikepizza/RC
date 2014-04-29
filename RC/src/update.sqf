/*
 * RC - Radio Communication v1.3
 * DayZ Epoch Script
 * by ilikepizza
 */

RC_playersLastDir = getDir player;
 
while {sleep RC_updateInterval; true} do {
    waitUntil {not RC_updateLocked};
    RC_updateLocked = true;
    
    //update unit markers
    {
        _x call RC_addUnitMarker;
        true
    } count RC_friends;
    
    //update vehicle markers
    {
        _x call RC_addVehicleMarker;
        true
    } count RC_vehicles;
    
    if (RC_2dGUI) then {
        call RC_update2dGUI;
    };
    
    if (RC_3DNames) then {
        call RC_update3dGUI;
    };
    
    RC_updateLocked = false;
};