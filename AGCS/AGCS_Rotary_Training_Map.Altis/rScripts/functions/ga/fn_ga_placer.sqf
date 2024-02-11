#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles the creation of actions on the tight lz table
 *
 * Arguments:
 * 
 * 
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call rScripts_fnc_ga_placer
 *
 * Public: No
 *
 */

_GAArray=[];
_townArray=[];
_starttitle="";
_startaction="";
_endtitle="";
_endaction="";
//Gets a list of all the triggers named tight_lz_#
{ 
    private _markerName = vehicleVarName _x;

    private _markerName = [_markerName, 0, 2] call BIS_fnc_trimString;
    //systemChat format ["%1",_markerName];
    
    if (toUpper _markerName=='GA_') then 
        {
            _GAArray pushBack _x;
        };

    
}forEach allMissionObjects "EmptyDetector"; 

//Splits each set of tight LZs by town any applies the trigger by town

{
    _findThis="_";
    //systemChat format ["%1",_x];
    _nameOfVar=vehicleVarName _x;
    _underscoreLocation= _nameOfVar find _findThis;
    //systemChat format ["%1",_underscoreLocation];
    _townname = [_nameOfVar,_underscoreLocation+1] call BIS_fnc_trimString;
    //systemChat _townname;
    //Adds Options to the start up table
    _starttitle=format ["ARE Task 5-7: Flight Plan, Escort, and Ground Attack: %1",_townname];
    _startaction=format ["[%1] call rScripts_fnc_ga_spawnmanager;",_x];
   
    _endtitle=format ["Clean Up: %1",_townname];
    _endaction=format ["[[%1]] call rScripts_fnc_ga_cleanup;",_x];
    //systemChat _startaction;
    GA_SELECTOR addAction [_startaction,_startaction];
    GA_SELECTOR addAction [_endtitle,_endaction];

}forEach _GAArray;

GA_SELECTOR addAction ["Clean Up All",   
  {    
  [_GAArray] call rScripts_fnc_ga_cleanup;
  }  
  ];
//_act = "[thisTrigger] call rScripts_fnc_tightlz_act";
//_act="";


/*
Condition
    no player and TIGHT_LZ_SMOKE_SPAWNER inArea
On activation 
    Spawn smoke every 45 seconds
On deactivation 
    Pick new LZ
*/