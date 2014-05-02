RC v1.3
==

Radio Communication Script for DayZ Epoch

####Features
* See other players tagged as friend on your Map/GPS
* Both players need a Radio to enable this
* See other players orientation and if in vehicle
* See players in GUI visible by radio on the map

###Installation
1. Copy the "RC" directory into your mission file.

2. Add
  > execVM "RC\init.sqf";

  at the end of your "init.sqf" in the mission file.
  
3. Add
  > \#include "RC\desc_inc.h"
  
  between
  
  > class RscTitles
  > {
  > 
  > };
  
  so that it looks like in the "description.ext" file. There may already be definitions in there, then add the line at the beginning or the end of the class RscTitles, but between the brackets.

4. If you have infiSTAR anti-hack on your server, read the AntiHack part in this thread: http://epochmod.com/forum/index.php?/topic/9593-release-radio-communication-script-v11/

###Changelog
####v1.3.1
* added realtime updating for 3D names
* added range limit for 3D names
* implemented missing 3d options

####v1.3
* added 3D Names
* fixed RC GUI interfering with dayz GUI
* added RC_path variable to move the script more easily

####v1.2
* fixed direction of players in vehicles
* added marker for players in vehicles (square around player)
* added options for the vehicle marker
* added GUI with player names currently visible by radio
* fixed markers of dead players, they are not shown anymore

####v1.1
* added color option
* added tranparency option
* added showing of player name option
* added list of used functions to help with BattleEye and Antihack configuration

####v1.0
* initial version