#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function finds a suitable position within a specified trigger area.
 *
 * Summary:
 * This function takes a trigger area and a road code as input and returns a position within the area that meets certain criteria based on the road code.
 *
 * Arguments:
 * 0: _AreatoCheck - A trigger area where this check will occur
 * 1: _RoadCode - An integer that determines if the spot needs to be on a road (1), off a road (2), or it doesn't matter (0)
 *
 * Return Value:
 * Position Value
 *
 * Example:
 * [TestTrg,2] call rScripts_fnc_ga_findsuitablespot;
 *
 * Public: No
 */
params ["_AreatoCheck","_RoadCode"];
 if (!isServer) exitWith {};
//_AreatoCheck=TestTrg;
//_RoadCode=2;
_loop=true;

// Pulls Trigger information to gather information about the position of roads and the area
_triggerinfo=triggerArea _AreatoCheck;
_radius=_triggerinfo select 0;
_triggerPOS = getPos _AreatoCheck;
_listOfRoads=_triggerPOS nearRoads _radius;
_listOfRoadPOS=[];
{
	_RoadPOS=getPosASL _x;
	_listOfRoadPOS pushBack _RoadPOS;
}forEach _listOfRoads;

// Loop through this code until a valid position is found (not [0,0])
while {_loop} do {
	switch (_RoadCode) do 
		{
			case 0:{
				_FinalPos=selectRandom _listOfRoadPOS;
				_FinalPos = [_FinalPos select 0, _FinalPos select 1, 0];
				if (true) exitWith {
					_FinalPos;
				};
			}; // On Road
			case 1:{
				_FinalPos=[[_AreatoCheck],[],{
					_OnRoadCond=!(isOnRoad _this); 
					_FlatEmptyCond=!((_this isFlatEmpty [2.5,-1,0.25,1,0,false,objNull]) isEqualTo []);
					// This uses flat empty to return a valid position at least 5m away from objects, and on a 27-degree slope so nothing tips over or spawns inside anything and not on water or near a coastline (within 25m of coast)
					_OnRoadCond && _FlatEmptyCond;
				}] call BIS_fnc_randomPos;
				_FinalPos = [_FinalPos select 0, _FinalPos select 1, 0];
				if (!(_FinalPos isEqualTo [0,0])) exitWith { 
					_FinalPos;
				}; 
			}; // Not On Road
			case 2:{
				_FinalPos=[[_AreatoCheck],[],{
					_FlatEmptyCond=!((_this isFlatEmpty [2.5,-1,0.25,1,0,false,objNull]) isEqualTo []);
					_FlatEmptyCond;
				}] call BIS_fnc_randomPos;
				_FinalPos = [_FinalPos select 0, _FinalPos select 1, 0];
				if (!(_FinalPos isEqualTo [0,0])) exitWith { 
					_FinalPos;
				}; 
			}; // Don't care if on road
		};	
};
