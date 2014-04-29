/*
 * RC - Radio Communication v1.2
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
    
    //show gui
    if (RC_gui_show) then {
  		RC_2dLayer cutRsc ["RadioGUI","PLAIN"];
    };
    
    // update 3d gui
    if (RC_3DNames) then {
        call RC_update3dNames;
    };
    
    RC_updateLocked = false;
};