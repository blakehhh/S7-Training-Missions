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
 * [TestTrg,2] call rScripts_fnc_ga_spawnunit;
 *
 * Public: No
 *
 */
 params ["_Location","_SpawnObject","_DoPatrol"];
//_Location=getPos Player;
//_SpawnObject="UK3CB_CW_SOV_O_Early_Igla_AA_pod";
//_DoPatrol=false;
//_Road=roadAt _Location;
//_Location= getPos _Road;
_PathVariable=typeName _SpawnObject;
_MaxPatrolDistance=100;
//Gets info on the road to get a direction
_Road=roadAt _Location;
_roadDirection=0;
// Assuming you have a location variable called "originalLocation"
// For example, if you have a marker named "myMarker" at the original location:
// originalLocation = getMarkerPos "myMarker";
//systemChat format["%1",_Location];
// Move the location up by 0.25 meters
//newZ = (_Location select 2) + 0.25;
//_Location = [_Location select 0, _Location select 1, newZ];
//systemChat format["%1",_Location];
// Now "newLocation" contains the updated location with the Z coordinate increased by 0.25 meters


if (!(_Road isEqualTo objNull)) then { 
	_Info = getRoadInfo _Road;
	_Info params ["_mapType", "_width", "_isPedestrian", "_texture", "_textureEnd", "_material", "_begPos", "_endPos", "_isBridge"];
	_roadDirection = _begPos getDir _endPos;
};
//If its a single object do one thing if its a group of objects do another
switch (_PathVariable) do {
	case "ARRAY":{
		_group=[_Location,east,_SpawnObject,[],[],[],[],[4,.6],_roadDirection,false,0] call BIS_fnc_spawnGroup; 
		if (_DoPatrol) then {
			[_Location,_group] call rScripts_fnc_ga_patrol;
		};	
	};
	case "STRING":{
		INFO_1("%1",_LOCATION);
		_Vic=_SpawnObject createVehicle _Location;
		_Vic setDir _roadDirection;
		_VicGroup=createVehicleCrew _Vic;
		_VicGroup setBehaviourStrong "COMBAT";
		if (_DoPatrol) then {
			[_Location,_VicGroup] call rScripts_fnc_ga_patrol;
		};
	};
	default {systemChat "INVALID DATA TYPE INPUTED INTO FN_GA_SPAWNONROAD"};
};