#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles the creation of actions on the tight LZ table
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call rScripts_fnc_tightlz_placer
 *
 * Public: No
 *
 */
  if (!isServer) exitWith {};
// Initialize arrays
_randomLZArray = [];
_townArray = [];
_townLZs = [];

// Define actions for activation and deactivation
_act = "[thisTrigger] call rScripts_fnc_smoke_maker";
_deact = format ["[%1,thisTrigger] call rScripts_fnc_tightlz_deact", _townLZs];

// Get a list of all triggers named tight_lz_#
{ 
    private _markerName = vehicleVarName _x;
    private _markerName = [_markerName, 0, 8] call BIS_fnc_trimString;
    if (toUpper _markerName == 'TIGHT_LZ_') then {
        _randomLZArray pushBack _x;
    };
} forEach allMissionObjects "EmptyDetector"; 

// Get a list of towns and separate LZs by town
{
    _findThis = "_";
    _nameOfVar = vehicleVarName _x;
    _underscoreLocation = _nameOfVar find [_findThis, 9];
    private _townname = [_nameOfVar, 9, _underscoreLocation - 1] call BIS_fnc_trimString;
    _townArray pushBackUnique _townname;
} forEach _randomLZArray;

// Split each set of tight LZs by town and apply triggers by town
{
    _townLZs = [];
    _townFilter = _x;

    {
        private _markerName = vehicleVarName _x;
        _findThis = "_";
        _underscoreLocation = _markerName find [_findThis, 9];
        private _townname = [_markerName, 9, _underscoreLocation - 1] call BIS_fnc_trimString;
        if (toUpper _townname isEqualTo toUpper _townFilter) then {
            _townLZs pushBack _x;
        };
    } forEach _randomLZArray;

    // Add options to the start up table
    _title = format ["ARE Task 1: Tight LZs %1", _townFilter];
    _start = format ["[%1,'%2'] call rScripts_fnc_tightlz_startaction;", _townLZs, _townFilter];
    TIGHT_LZ_SELECTOR addAction [_title, _start];

    // Apply triggers for each LZ in the town
    {
        _x setTriggerType "NONE";
        _x setTriggerActivation ["ANYPLAYER", "NOT PRESENT", true];
        _x setTriggerStatements ["this && TIGHT_LZ_SMOKE_SPAWNER inArea thisTrigger", _act, _deact];
    } forEach _townLZs;
} forEach _townArray;

// Add stop action to the selector
TIGHT_LZ_SELECTOR addAction ["STOP ARE TASK 1: Tight LZs", {    
    TIGHT_LZ_SMOKE_SPAWNER setPOS (getPOS TIGHT_LZ_HQ);    
}]; 
