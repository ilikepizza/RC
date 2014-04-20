/*
 * RC - Radio Communication v1.1
 * DayZ Epoch Script
 * by ilikepizza
 */
 
while { true} do {
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
    
    sleep RC_updateInterval;
};