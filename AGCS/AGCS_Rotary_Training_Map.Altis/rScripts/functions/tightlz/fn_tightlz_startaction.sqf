#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles when you select an option from the table how it behaves
 *
 * Arguments:
 * 0: List of Locations in an array
 * 1: Which Town this is for
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call rScripts_fnc_tightlz_startaction
 *
 * Public: No
 *
 */

params ["_randomLZArray","_townFilter"];

_randomLZ = selectRandom _randomLZArray; 
TIGHT_LZ_SMOKE_SPAWNER setPOS (getPOS _randomLZ);
[[west,"HQ"],format ["Proceed to %1",_townFilter]] remoteExec ["sideChat",-2];