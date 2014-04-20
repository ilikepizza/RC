/*
 * RC - Radio Communication v1.1
 * DayZ Epoch Script
 * by ilikepizza
 * 
 * Script can be configured by editing this file.
 */

//----------------------------
// Script Update Configuration
//----------------------------
 
// Interval of resetting the markers to the player positions. Decreasing this value improves accuracy of the position.
RC_updateInterval = 0.5;

// Interval of checking if other players can join the radio channel of the player. All players joining a channel need to fulfill some conditions.
RC_addInterval = 2;

//------------------
//Icon Configuration
//------------------
// Informations: https://community.bistudio.com/wiki/Mission_Editor:_Markers

// Type of unit marker icon, see https://community.bistudio.com/wiki/cfgMarkers for possible types
RC_unitMarkerType = "mil_start";

//The vehicle marker icon will be shown additionally to the unit marker icon
RC_vehicleMarkerType = "Car";

// Size of the unit marker icon (does affect not the name)
RC_unitMarkerSize = 0.5;

//Size of the vehicle marker icon
RC_vehicleMarkerSize = 1.0;

// Transparency of the marker icon and player name
RC_markerAlpha = 1.0;

// Color of the marker icon and player name, see https://community.bistudio.com/wiki/setMarkerColor for possible colors
RC_markerColor = "ColorGreen";

// Enable showing of the players name next to the marker
RC_markerShowName = true;

// Enable showing Radio GUI (Radio logo and names of active communications)
RC_gui_en = true;

// Color of the player ames in the Radio GUI
RC_guiNameColor = [1,1,1,1];
