#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function cleans up units and vehicles within a specified trigger area.
 *
 * Summary:
 * This function takes a trigger area as input and deletes all units and vehicles within it. It is useful for preparing an area for further operations or resetting the environment.
 *
 * Arguments:
 * 0: _AreatoCheck - A trigger area where the cleanup will occur
 *
 * Example:
 * [TestTrg,2] call rScripts_fnc_ga_cleanup;
 *
 * Public: No
 */
params ["_AreastoCheck"];
 if (!isServer) exitWith {};
{
	_areaSingle=_x;
	
	// Delete all units within the trigger area
	{deleteVehicle _x} foreach (allunits select {_x inArea _areaSingle}); 
	
	// Delete all dead units within the trigger area
	{deleteVehicle _x} foreach (allDead select {_x inArea _areaSingle}); 
	
	// Delete all vehicles within the trigger area
	{deleteVehicle _x} foreach (vehicles select {_x inArea _areaSingle});
} forEach _AreastoCheck;

// Send a side chat message to the west side indicating completion
[[west,"HQ"],"Good job"] remoteExec ["sideChat",-2];
