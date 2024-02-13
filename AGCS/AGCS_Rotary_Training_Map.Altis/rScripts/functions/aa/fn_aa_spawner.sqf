#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles the spawning of helicopters with optional gunners.
 *
 * Arguments:
 * 0: _limit - Sets the number of choppers to be spawned
 * 1: _noGunner - Boolean, indicates whether the gunner needs to be removed or not
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [1,false] call rScripts_fnc_aa_spawner
 *
 * Public: No
 * TO DO: Convert for loop to a while loop using logic from GA
 */

params ["_limit","_noGunner"];
 if (!isServer) exitWith {};
// List of helicopters that can be spawned
_randomHeli=[ 
"RHS_Mi24P_vdv", 
"RHS_Mi24V_vdv", 
"RHS_Mi8MVT3_vdv", 
"RHS_Ka52_vvsc", 
"RHS_Mi28N_vvsc" 
];  
_i=0;
_MaxHeight=501; 
while {_i<_limit} do { 
	// Get count of nearby objects before spawning a helicopter
	_beforecountArray=getpos SpawnArea nearObjects 6000;
	_beforecount=count _beforecountArray;
	
	// Randomly select a helicopter from the list
	_HeliType = selectRandom _randomHeli;   
	
	// Get a random spawn position within SpawnArea
	_spawnPos = [[SpawnArea],[Thunderdome]] call BIS_fnc_randomPos; 
	
	// Get center position for direction calculation
	_centerPos = getMarkerPos "CenterMarker"; 
	
	// Calculate direction for the helicopter to face
	_direction = _spawnPos getDir _centerPos; 
	
	// Determine a random height for the spawn position
	_randomHeight = random [10,_MaxHeight,_MaxHeight/2]; 
	_spawnPos set [2,_randomHeight]; 
	_centerPos set [2,_randomHeight]; 
	
	// Create the helicopter and its crew
	_Heli = createVehicle [_HeliType,_spawnPos,[],0,"FLY"];
	createVehicleCrew _Heli;
	_Heli setDir _direction;
	_HeliGroup=group _Heli;
	
	// Set the helicopter's unit behaviour to combat and give it a search and destroy waypoint
	_HeliGroup setBehaviourStrong "COMBAT";
	_WayPointVar=_HeliGroup addWaypoint [_centerPOS,500];
	_WayPointVar setWaypointType "SAD";
	
	// Remove gunner if specified
	if (_noGunner) then {
		_gunnerunit=gunner _Heli;
		deleteVehicle _gunnerunit;
	};
	
	// Get count of nearby objects after spawning a helicopter
	_aftercountArray=getpos SpawnArea nearObjects 6000;
	_aftercount=count _aftercountArray;
	
	// Increment counter if new helicopter spawned
	if (_aftercount>_beforecount) then {
		_i=_i+1;
	};
};   
