#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function dynamically spawns ground units based on specified locations and conditions.
 *
 * Summary:
 * This function dynamically spawns ground units based on specified conditions such as road status, number of units, and patrol behavior.
 *
 * Arguments:
 * - _RoadStatus: An integer representing the road status (0 for road spawns, 1 for non-road spawns, 2 for all spawns).
 * - _UnitCount: The number of units to spawn.
 * - _randomUnitArray: An array of unit types to randomly choose from.
 * - _dopatrol: A boolean indicating whether units should patrol or not.
 * - _RoadSpawns: An array containing road spawn locations.
 * - _NotRoadSpawns: An array containing non-road spawn locations.
 * - _AllSpawns: An array containing all spawn locations.
 * - _TriggerArea: The trigger area where units should be spawned around.
 *
 * Return Value:
 * An array containing the remaining spawn locations after the units are spawned.
 *
 * Example:
 * [0,3,["UK3CB_CW_SOV_O_EARLY_BTR40", "UK3CB_CW_SOV_O_EARLY_BTR40_MG", "UK3CB_CW_SOV_O_EARLY_BTR70", "UK3CB_CW_SOV_O_EARLY_BTR60", "UK3CB_CW_SOV_O_EARLY_MTLB_BMP", "UK3CB_CW_SOV_O_EARLY_MTLB_KPVT", "UK3CB_CW_SOV_O_EARLY_2S1", "UK3CB_CW_SOV_O_EARLY_2S3", "UK3CB_CW_SOV_O_EARLY_BM21", "UK3CB_CW_SOV_O_EARLY_T55", "UK3CB_CW_SOV_O_EARLY_T72A", "UK3CB_CW_SOV_O_EARLY_T72B", "UK3CB_CW_SOV_O_EARLY_T72BA", "UK3CB_CW_SOV_O_EARLY_T80", "UK3CB_CW_SOV_O_EARLY_T80A", "UK3CB_CW_SOV_O_EARLY_T80B"],true,[[7144.44,16556,0],[7134.49,16706,0],[7098.18,16041.3,0],[7362.29,16215.9,0],[7123.43,16668.7,0],[6927.2,16508.3,0],[7139.56,16736.6,0],[7132.49,16102.1,0]],[[7132.49,16102.1,0]],[]] call rScripts_fnc_ga_spawnloop;
 *
 * Public: No
 */
params [["_RoadStatus",0,[0]],["_UnitCount",0,[0]],["_randomUnitArray",["UK3CB_CW_SOV_O_EARLY_BTR40"],[[]]],["_dopatrol",false,[true]],["_RoadSpawns",[0,0,0],[[]]],["_NotRoadSpawns",[0,0,0],[[]]],["_AllSpawns",[0,0,0],[[]]],["_TriggerArea",objNull,[objNull]]];
//SHOW_CHAT_INFO_1("GA_SPAWNLOOP","%1",_RoadSpawns);

_i=0;
switch (_RoadStatus) do {
	case 0:{while {_i<_UnitCount} do {
					_beforecountArray=getpos _TriggerArea nearObjects 750;
					_beforecount=count _beforecountArray;
					_SelectLoc=random count _RoadSpawns;
					_Location = _RoadSpawns select _SelectLoc;
					_VicToSpawn=selectRandom _randomUnitArray;
					[_Location,_VicToSpawn,_dopatrol] call rScripts_fnc_ga_spawnunit;
					_aftercountArray=getpos _TriggerArea nearObjects 750;
					_aftercount = count _aftercountArray;
					if (_aftercount>_beforecount) then {
						_RoadSpawns deleteAt _SelectLoc;
						_i=_i+1;
					};
				};	
			};
	case 1:{while {_i<_UnitCount} do {
					_beforecountArray=getpos _TriggerArea nearObjects 750;
					_beforecount=count _beforecountArray;
					_SelectLoc=random count _NotRoadSpawns;
					_Location = _NotRoadSpawns select _SelectLoc;
					_VicToSpawn=selectRandom _randomUnitArray;
					[_Location,_VicToSpawn,_dopatrol] call rScripts_fnc_ga_spawnunit;
					_aftercountArray=getpos _TriggerArea nearObjects 750;
					_aftercount = count _aftercountArray;
					if (_aftercount>_beforecount) then {
						_NotRoadSpawns deleteAt _SelectLoc;
						_i=_i+1;
					};	
				};
			};
	case 2:{while {_i<_UnitCount} do {
					_beforecountArray=getpos _TriggerArea nearObjects 750;
					_beforecount=count _beforecountArray;
					_SelectLoc=random count _AllSpawns;
					_Location = _AllSpawns select _SelectLoc;
					_VicToSpawn=selectRandom _randomUnitArray;
					[_Location,_VicToSpawn,_dopatrol] call rScripts_fnc_ga_spawnunit;
					_aftercountArray=getpos _TriggerArea nearObjects 750;
					_aftercount = count _aftercountArray;
					if (_aftercount>_beforecount) then {
						_AllSpawns deleteAt _SelectLoc;
						_i=_i+1;
					};
				};
			};
};
//INFO_1("GA_SPAWNLOOP","%1",_RoadSpawns);
_spawnsleft=[_RoadSpawns,_NotRoadSpawns,_AllSpawns];
_spawnsleft;