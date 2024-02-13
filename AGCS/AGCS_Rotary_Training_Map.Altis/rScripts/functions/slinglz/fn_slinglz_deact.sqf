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
 * call rScripts_fnc_slinglz_deact
 *
 * Public: No
 *
 */
params ["_thisTrigger"];

// Move the SLING_LZ_SMOKE_SPAWNER to the position of SLING_LZ_HQ
SLING_LZ_SMOKE_SPAWNER setPOS (getPOS SLING_LZ_HQ);   

// Find the first land vehicle in the mission
_vehicleArray = vehicles select {_x isKindOf "LandVehicle"}; 
_vehicle = _vehicleArray select 0; 

// Calculate the vehicle damage percentage
_vehicleDamage = damage _vehicle; 
_inverseVehicleDamage = 1 - _vehicleDamage; 

// Display the vehicle health percentage in side chat
_message = format ["Vehicle Health Percentage: %1", _inverseVehicleDamage]; 
[[west,"HQ"], _message] remoteExec ["sideChat"];

// Delete units, dead units, and vehicles within the trigger area
{deleteVehicle _x} foreach (allunits select {_x inArea _thisTrigger}); 
{deleteVehicle _x} foreach (allDead select {_x inArea _thisTrigger}); 
{deleteVehicle _x} foreach (vehicles select {_x inArea _thisTrigger});
