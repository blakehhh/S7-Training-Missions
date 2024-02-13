#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function sets up actions for managing ground attacks.
 *
 * Summary:
 * This function sets up actions to manage ground attacks, such as spawning units and cleaning up after attacks.
 *
 * Arguments:
 * None
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
 if (!isServer) exitWith {};
_GAArray=[];
_townArray=[];
_starttitle="";
_startaction="";
_endtitle="";
_endaction="";

// Gets a list of all triggers named GA_#
{ 
    private _markerName = vehicleVarName _x;
    private _markerName = [_markerName, 0, 2] call BIS_fnc_trimString;

    if (toUpper _markerName=='GA_') then 
    {
        _GAArray pushBack _x;
    };   
} forEach allMissionObjects "EmptyDetector"; 

// Splits each set of triggers by town and applies the trigger by town
{
    _findThis="_";
    _nameOfVar=vehicleVarName _x;
    _underscoreLocation= _nameOfVar find _findThis;
    _townname = [_nameOfVar,_underscoreLocation+1] call BIS_fnc_trimString;

    // Adds options to the startup table
    _starttitle=format ["ARE Task 5-7: Flight Plan, Escort, and Ground Attack: %1",_townname];
    _startaction=format ["[%1] call rScripts_fnc_ga_spawnmanager;",_x];
   
    _endtitle=format ["Clean Up: %1",_townname];
    _endaction=format ["[[%1]] call rScripts_fnc_ga_cleanup;",_x];
    
    GA_SELECTOR addAction [_startaction,_startaction];
    GA_SELECTOR addAction [_endtitle,_endaction];
} forEach _GAArray;

// Adds a "Clean Up All" action
GA_SELECTOR addAction ["Clean Up All",   
{    
    [_GAArray] call rScripts_fnc_ga_cleanup;
}];

