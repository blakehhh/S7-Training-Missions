#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function sets up patrol waypoints for a group at a specified location.
 *
 * Summary:
 * This function takes a location and a group as input and sets up patrol waypoints around that location for the given group.
 *
 * Arguments:
 * 0: _Location - Location around which the patrol will be set up
 * 1: _group - Group to which the patrol waypoints will be assigned
 *
 * Return Value:
 * Position Value
 *
 * Example:
 * [TestTrg,2] call rScripts_fnc_ga_patrol;
 *
 * Public: No
 *
 */
params ["_Location","_group"];

// Define waypoints
_waypointsArray = [
    [(_Location select 0) + 50, (_Location select 1) + 50, 0],  // Waypoint 1
    [(_Location select 0) + 50, (_Location select 1) - 50, 0],  // Waypoint 2
    [(_Location select 0) - 50, (_Location select 1) - 50, 0],  // Waypoint 3
    [(_Location select 0) - 50, (_Location select 1) + 50, 0]  // Waypoint 4 (Cycle)
];

// Add waypoints to the unit
{
    _waypointMark=_group addWaypoint [_x, 100];
	if ((count _waypointsArray)-1==_forEachIndex) then {
		_waypointMark setWaypointType "CYCLE";
	};
} forEach _waypointsArray;
