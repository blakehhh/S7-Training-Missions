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
params ["_randomLZArray", "_townFilter"];

// Select a random LZ from the given list of locations
_randomLZ = selectRandom _randomLZArray; 

// Move the TIGHT_LZ_SMOKE_SPAWNER to the position of the randomly selected LZ
TIGHT_LZ_SMOKE_SPAWNER setPOS (getPOS _randomLZ);

// Send a message to the west side's HQ indicating the town to proceed to
[[west,"HQ"], format ["Proceed to %1", _townFilter]] remoteExec ["sideChat", -2];
