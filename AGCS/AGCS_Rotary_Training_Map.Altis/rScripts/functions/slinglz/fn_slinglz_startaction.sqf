#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles spawning a vehicle and moving the sling load LZ selector
 *
 * Arguments:
 * 0: List of Locations in an array
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
params ["_randomLZArray"];

// Select a random LZ from the given list of locations
_randomLZ = selectRandom _randomLZArray;   

// Get the position of the randomly selected LZ
_randomLZPOS = getPOS _randomLZ; 

// Move the SLING_LZ_SMOKE_SPAWNER to the position of the randomly selected LZ
SLING_LZ_SMOKE_SPAWNER setPOS (_randomLZPOS);  

// Create a vehicle at SLING_LZ_HQ
_load = createVehicle ["B_T_LSV_01_unarmed_F", SLING_LZ_HQ]; 
