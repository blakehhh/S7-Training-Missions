#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles 
 *
 * Arguments:
 * 0: List of Locations in an array
 * 1: Trigger in question
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call rScripts_fnc_tightlz_act
 *
 * Public: No
 *
 */
params ["_randomLZArray", "_thisTrigger"];

// Deletes the smoke in the tight LZ
_locationtoclear = getPos _thisTrigger;
_locationtoclear = [_locationtoclear select 0, _locationtoclear select 1, 0];
_objectArray = nearestObjects [getPos _thisTrigger, ["SmokeShellGreen_Infinite", "SmokeShellYellow_Infinite", "SmokeShellPurple_Infinite", "SmokeShellBlue_Infinite", "NVG_TargetC"], 8];
{
    deleteVehicle _x;
} forEach _objectArray;

// Selects a new random LZ
_randomLZ = selectRandom _randomLZArray;    
_SamePositionCheck = getPosASL _randomLZ;    
_spawnerPOS = getPosASL TIGHT_LZ_SMOKE_SPAWNER;    
_HQPOS = getPosASL TIGHT_LZ_HQ;   

// Make sure the LZ chosen is not the exact same one, loop through until they are different
if (_SamePositionCheck isEqualto _spawnerPOS) then {
    while {_SamePositionCheck isEqualto _spawnerPOS} do {
        _randomLZ = selectRandom _randomLZArray;  
        _spawnerPOS = getPosASL TIGHT_LZ_SMOKE_SPAWNER;    
        _SamePositionCheck = getPosASL _randomLZ;   
    }; 
};

if !(_HQPOS isEqualto _spawnerPOS) then {    
    _LZ = getPosASL _randomLZ;
    _LZ = [_LZ select 0, _LZ select 1, 0];
    TIGHT_LZ_SMOKE_SPAWNER setPOS (_LZ);   
    [[west,"HQ"], "New LZ Placed"] remoteExec ["sideChat", -2];    
} else {
    [[west,"HQ"], "ARE TASK 1 Tight LZs Training Complete"] remoteExec ["sideChat", -2];
};
