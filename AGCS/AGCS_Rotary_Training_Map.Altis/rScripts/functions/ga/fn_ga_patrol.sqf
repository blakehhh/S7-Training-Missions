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
//_lastWaypoint=count _waypointsArray;
//_lastWaypoint=_lastWaypoint-1;
//_i=0;
// Add waypoints to the unit
{
    _waypointMark=_group addWaypoint [_x, 100];
	if ((count _waypointsArray)-1==_forEachIndex) then {
		_waypointMark setWaypointType "CYCLE";
	};
	
} forEach _waypointsArray;


