/*
 * RC - Radio Communication v1.1
 * DayZ Epoch Script
 * by ilikepizza
 */
 
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
  		cutRsc ["RadioGUI","PLAIN"];
    };
    
    RC_updateLocked = false;
    
    diag_log "updateMarkers";
};