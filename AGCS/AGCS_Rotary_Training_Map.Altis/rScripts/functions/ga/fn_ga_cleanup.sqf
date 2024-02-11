#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function finds a 
 *
 * Arguments:
 * 0: AreatoCheck A trigger for which this check will happen in
 * 1: RoadCode an int that determines if we care if something is on a road, off a road or we just don't care
 * Return Value:
 * Position Value
 *
 * Example:
 * [TestTrg,2] call rScripts_fnc_ga_findsuitablespot;
 *
 * Public: No
 *
 */
 params ["_AreastoCheck",[],[[]]];

{
	_areaSingle=_x;
	// Current result is saved in variable _x
	{deleteVehicle _x} foreach (allunits select {_x inArea _areaSingle}); 
	{deleteVehicle _x} foreach (allDead select {_x inArea _areaSingle}); 
	{deleteVehicle _x} foreach (vehicles select {_x inArea _areaSingle});
} forEach _AreastoCheck;
 [[west,"HQ"],"Good job"] remoteExec ["sideChat",-2]; 