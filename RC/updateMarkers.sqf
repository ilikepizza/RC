/*
 * RC - Radio Communication v1.0
 * DayZ Epoch Script
 * by ilikepizza
 */
 
while { true} do {
    //update markers
    {
        _name = _x select 0;
        _unit = _x select 1;
        
        [_unit, _name] call RC_addMarker;
    } count RC_friends;
    sleep RC_updateInterval;
};