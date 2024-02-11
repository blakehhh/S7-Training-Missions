#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles when you select an option from the table how it behaves
 *
 * Arguments:
 * 0: thisTrigger
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call rScripts_fnc_slinglz_deact
 *
 * Public: No
 *
 */

 params ["_thisTrigger"];

 SLING_LZ_SMOKE_SPAWNER setPOS (getPOS SLING_LZ_HQ);   
_vehicleArray=vehicles select {_x isKindOf "LandVehicle"}; 
_vehicle= _vehicleArray select 0; 
_vehicleDamage = damage _vehicle; 
_inverseVehicleDamage = 1-_vehicleDamage; 
_message=format ["Vechile Health Percentage: %1",_inverseVehicleDamage]; 
[[west,"HQ"],_message] remoteExec ["sideChat"] ; 
{deleteVehicle _x} foreach (allunits select {_x inArea _thisTrigger}); 
{deleteVehicle _x} foreach (allDead select {_x inArea _thisTrigger}); 
{deleteVehicle _x} foreach (vehicles select {_x inArea _thisTrigger});