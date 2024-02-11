#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles 
 *
 * Arguments:
 * 0: _limit Sets the number of choppers to be spawned
 * 1: _noGunner Boolean, tells script if gunner needs to be removed or not
 * Return Value:
 * Nothing
 *
 * Example:
 * [1,false] call rScripts_fnc_aa_spawner
 *
 * Public: No
 * TO DO: Convert for to +while loop using logic from GA
 */

params ["_limit","_noGunner"];
//List of helicopters taht can be spawned
//
//_limit=3;
//_noGunner=true;
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
	_beforecountArray=getpos SpawnArea nearObjects 6000;
	_beforecount=count _beforecountArray;
	//For the limit loop through the following code. The code randomly selects one of the choppers in the array abovefinds a suitable spawn point spawns the chopper at a random height and adds the crew for it
	_HeliType = selectRandom _randomHeli;   
	_spawnPos = [[SpawnArea],[Thunderdome]] call BIS_fnc_randomPos; 
	_centerPos = getMarkerPos "CenterMarker"; 
	_direction = _spawnPos getDir _centerPos; 
	_randomHeight = random [10,_MaxHeight,_MaxHeight/2]; 
	_spawnPos set [2,_randomHeight]; 
	_centerPos set [2,_randomHeight]; 
	_Heli = createVehicle [_HeliType,_spawnPos,[],0,"FLY"];
	createVehicleCrew _Heli;
	_Heli setDir _direction;
	_HeliGroup=group _Heli;
//Sets the helicopters unit behaviour to combat and gives it a search and destroy waypoint
	_HeliGroup setBehaviourStrong "COMBAT";
	_WayPointVar=_HeliGroup addWaypoint [_centerPOS,500];
	_WayPointVar setWaypointType "SAD";
	if (_noGunner) then {
		_gunnerunit=gunner _Heli;
		deleteVehicle _gunnerunit;
	};
	_aftercountArray=getpos SpawnArea nearObjects 6000;
	_aftercount=count _aftercountArray;
	if (_aftercount>_beforecount) then {
		_i=_i+1;
	};
};   
