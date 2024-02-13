#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles when you select an option from the table how it behaves
 *
 * Arguments:
 * 0: thisTrigger - The trigger object that activates the function
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call rScripts_fnc_slinglz_placer
 *
 * Public: No
 *
 */

// Define actions for activation and deactivation
_act = "[thisTrigger] call rScripts_fnc_smoke_maker; call rScripts_fnc_slinglz_act";
_deact = "[thisTrigger] call rScripts_fnc_slinglz_deact";

// Get a list of all triggers named sling_lz_#
_randomLZArray = [];
{ 
    private _markerName = vehicleVarName _x;
    private _markerName = [_markerName, 0, 8] call BIS_fnc_trimString;
    if (toUpper _markerName == 'SLING_LZ_') then {
        _randomLZArray pushBack _x;
    };  
} forEach allMissionObjects "EmptyDetector"; 

// Apply the same condition, activation, and deactivation to each of the triggers
{
    _conditionStatement = format["SLING_LZ_SMOKE_SPAWNER inArea %1 && ({_x inArea thisTrigger} count (vehicles select {_x isKindOf 'LandVehicle'})) == 0", _x];
    _x setTriggerType "NONE";
    _x setTriggerActivation ["ANYPLAYER", "NOT PRESENT", true];
    _x setTriggerStatements [_conditionStatement, _act, _deact];
} forEach _randomLZArray;

// Add actions to SLING_LZ_SELECTOR
_title = format ["ARE Task 2: Sling Loading"];
_start = format ["[%1] call rScripts_fnc_slinglz_startaction;", _randomLZArray];
SLING_LZ_SELECTOR addAction ["ARE Task 2: Sling Loading", _start];  
SLING_LZ_SELECTOR addAction ["STOP ARE Task 2: Sling Loading", {   
    SLING_LZ_SMOKE_SPAWNER setPOS (getPOS SLING_LZ_HQ);   
}]; 
