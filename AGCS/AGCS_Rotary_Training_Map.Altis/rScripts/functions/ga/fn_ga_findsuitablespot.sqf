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
 params ["_AreatoCheck","_RoadCode"];
//_AreatoCheck=TestTrg;
//_RoadCode=2;
_loop=true;

//Pulls Trigger information to gather information about the position of roads an the area
_triggerinfo=triggerArea _AreatoCheck;
_radius=_triggerinfo select 0;
_triggerPOS = getPos _AreatoCheck;
_listOfRoads=_triggerPOS nearRoads _radius;
_listOfRoadPOS=[];
{
	_RoadPOS=getPosASL _x;
	_listOfRoadPOS pushBack _RoadPOS;
}forEach _listOfRoads;

//Loop through this code until a valid position is found (not [0,0])
while {_loop} do {
	switch (_RoadCode) do 
		{
			case 0:{_FinalPos=selectRandom _listOfRoadPOS;
					_FinalPos = [_FinalPos select 0, _FinalPos select 1, 0];
					if (true) exitWith {
						_FinalPos;
						};
					}; //On Road
			case 1:{_FinalPos=[[_AreatoCheck],[],{_OnRoadCond=!(isOnRoad _this); 
			   		_FlatEmptyCond=!((_this isFlatEmpty [2.5,-1,0.25,1,0,false,objNull]) isEqualTo []);	//This is using flat empty to return a valid position at least 5m away from objects, and on a 27 degree slope so nothing tips over or spawns inside anything and not on water or near a coast line (within 25m of coast)
			  		_OnRoadCond&&_FlatEmptyCond;}] call BIS_fnc_randomPos;
					_FinalPos = [_FinalPos select 0, _FinalPos select 1, 0];
					if(!(_FinalPos isEqualTo [0,0])) exitWith      { 
       					_FinalPos;
      					}; 
					}; //Not On Road
			case 2:{_FinalPos=[[_AreatoCheck],[],{_FlatEmptyCond=!((_this isFlatEmpty [2.5,-1,0.25,1,0,false,objNull]) isEqualTo []);_FlatEmptyCond;}] call BIS_fnc_randomPos;
					_FinalPos = [_FinalPos select 0, _FinalPos select 1, 0];
					if(!(_FinalPos isEqualTo [0,0])) exitWith      { 
       					_FinalPos;
      					}; 
					}; //Don't care if on road
		};	
};
