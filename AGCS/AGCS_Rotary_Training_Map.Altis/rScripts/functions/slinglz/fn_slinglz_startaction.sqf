#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles spawning a vechile and moving the sling load lz selector
 *
 * Arguments:
 * 0: List of Locations in an array
 *
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

_randomLZ = selectRandom _randomLZArray;   
_randomLZPOS = getPOS _randomLZ; 
SLING_LZ_SMOKE_SPAWNER setPOS (_randomLZPOS);  
_load=createVehicle ["B_T_LSV_01_unarmed_F",SLING_LZ_HQ]; 