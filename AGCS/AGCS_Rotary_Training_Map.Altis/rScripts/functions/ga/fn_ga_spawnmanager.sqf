#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles the spawning of various units, including vehicles, infantry, and anti-aircraft units.
 *
 * Arguments:
 * 0: _TriggerArea Trigger area object for spawning
 * 1: _MaxVic Maximum number of vehicles to spawn
 * 2: _VicOnRoadStatus Status indicating if vehicles should spawn on roads
 * 3: _MaxNumofSquads Maximum number of infantry squads to spawn
 * 4: _InfOnRoadStatus Status indicating if infantry should spawn on roads
 * 5: _MaxIGLATurret Maximum number of Igla anti-aircraft turrets to spawn
 * 6: _IglaOnRoadStatus Status indicating if Igla turrets should spawn on roads
 * 7: _MaxRadarGuidedGun Maximum number of radar-guided gun units to spawn
 * 8: _RadarGuidedGunStatus Status indicating if radar-guided gun units should spawn on roads
 * 
 * Return Value:
 * Nothing
 *
 * Example:
 * [GA_KORE, 1, 0, 0, 0, 0, 1, 0, 0] call rScripts_fnc_ga_spawnmanager
 *
 * Public: No
 */

params [["_TriggerArea",objNull,[objNull]],["_MaxVic",3],["_VicOnRoadStatus",0],["_MaxNumofSquads",3],["_InfOnRoadStatus",0],["_MaxIGLATurret",1],["_IglaOnRoadStatus",1],["_MaxRadarGuidedGun",1],["_RadarGuidedGunStatus",0]];
 if (!isServer) exitWith {};
//OPFOR Units Definitions
_randomVehicleArray=["UK3CB_CW_SOV_O_EARLY_BTR40", 
"UK3CB_CW_SOV_O_EARLY_BTR40_MG", 
"UK3CB_CW_SOV_O_EARLY_BTR70", 
"UK3CB_CW_SOV_O_EARLY_BTR60", 
"UK3CB_CW_SOV_O_EARLY_MTLB_BMP", 
"UK3CB_CW_SOV_O_EARLY_MTLB_KPVT", 
"UK3CB_CW_SOV_O_EARLY_2S1", 
"UK3CB_CW_SOV_O_EARLY_2S3", 
"UK3CB_CW_SOV_O_EARLY_BM21", 
"UK3CB_CW_SOV_O_EARLY_T55", 
"UK3CB_CW_SOV_O_EARLY_T72A", 
"UK3CB_CW_SOV_O_EARLY_T72B", 
"UK3CB_CW_SOV_O_EARLY_T72BA", 
"UK3CB_CW_SOV_O_EARLY_T80", 
"UK3CB_CW_SOV_O_EARLY_T80A", 
"UK3CB_CW_SOV_O_EARLY_T80B" 
]; 
_randomInfantryArray=[["UK3CB_CW_SOV_O_EARLY_TL","UK3CB_CW_SOV_O_EARLY_AT","UK3CB_CW_SOV_O_EARLY_AT_ASST","UK3CB_CW_SOV_O_EARLY_RIF_1","UK3CB_CW_SOV_O_EARLY_MD","UK3CB_CW_SOV_O_EARLY_RIF_1","UK3CB_CW_SOV_O_EARLY_RIF_1","UK3CB_CW_SOV_O_EARLY_TL","UK3CB_CW_SOV_O_EARLY_SL"], 
["UK3CB_CW_SOV_O_EARLY_TL","UK3CB_CW_SOV_O_EARLY_MG","UK3CB_CW_SOV_O_EARLY_MG_ASST","UK3CB_CW_SOV_O_EARLY_RIF_2","UK3CB_CW_SOV_O_EARLY_TL","UK3CB_CW_SOV_O_EARLY_MD","UK3CB_CW_SOV_O_EARLY_RIF_2","UK3CB_CW_SOV_O_EARLY_RIF_1","UK3CB_CW_SOV_O_EARLY_TL","UK3CB_CW_SOV_O_EARLY_SL"], 
["UK3CB_CW_SOV_O_EARLY_TL","UK3CB_CW_SOV_O_EARLY_RIF_1","UK3CB_CW_SOV_O_EARLY_MK","UK3CB_CW_SOV_O_EARLY_RIF_2","UK3CB_CW_SOV_O_EARLY_TL","UK3CB_CW_SOV_O_EARLY_MD","UK3CB_CW_SOV_O_EARLY_RIF_2","UK3CB_CW_SOV_O_EARLY_RIF_1","UK3CB_CW_SOV_O_EARLY_TL","UK3CB_CW_SOV_O_EARLY_SL"], 
["UK3CB_CW_SOV_O_EARLY_TL","UK3CB_CW_SOV_O_EARLY_RIF_1","UK3CB_CW_SOV_O_EARLY_AR","UK3CB_CW_SOV_O_EARLY_RIF_2","UK3CB_CW_SOV_O_EARLY_TL","UK3CB_CW_SOV_O_EARLY_MD","UK3CB_CW_SOV_O_EARLY_RIF_2","UK3CB_CW_SOV_O_EARLY_RIF_1","UK3CB_CW_SOV_O_EARLY_TL","UK3CB_CW_SOV_O_EARLY_SL"] 
]; 
_IglaTurret=["UK3CB_CW_SOV_O_Early_Igla_AA_pod"];
_RadarGuidedGun=["UK3CB_CW_SOV_O_EARLY_ZsuTank"];

_RoadSpawns=[];
_NotRoadSpawns=[];
_AllSpawns=[];
_RoadIterations=0;
_NotRoadIterations=0;
_AnythingSpawnIterations=0;

//Increase the max number of iterations to run the suitable spot only one time for each thing
switch (_VicOnRoadStatus) do {
	case 0:{_RoadIterations=_RoadIterations+_MaxVic;};
	case 1:{_NotRoadIterations=_NotRoadIterations+_MaxVic;};
	case 2:{_AnythingSpawnIterations=_AnythingSpawnIterations+_MaxVic;};
};
switch (_InfOnRoadStatus) do {
	case 0:{_RoadIterations=_RoadIterations+_MaxNumofSquads;};
	case 1:{_NotRoadIterations=_NotRoadIterations+_MaxNumofSquads;};
	case 2:{_AnythingSpawnIterations=_AnythingSpawnIterations+_MaxNumofSquads;};
};
switch (_IglaOnRoadStatus) do {
	case 0:{_RoadIterations=_RoadIterations+_MaxIGLATurret;};
	case 1:{_NotRoadIterations=_NotRoadIterations+_MaxIGLATurret;};
	case 2:{_AnythingSpawnIterations=_AnythingSpawnIterations+_MaxIGLATurret;};
};
switch (_RadarGuidedGunStatus) do {
	case 0:{_RoadIterations=_RoadIterations+_MaxRadarGuidedGun;};
	case 1:{_NotRoadIterations=_NotRoadIterations+_MaxRadarGuidedGun;};
	case 2:{_AnythingSpawnIterations=_AnythingSpawnIterations+_MaxRadarGuidedGun;};
};

//Find all unique locations to spawn stuff
_countofArray=0;
while {_RoadIterations!=_countofArray} do {
	_Pos=[_TriggerArea,0] call rScripts_fnc_ga_findsuitablespot;
	_RoadSpawns pushBackUnique _Pos;
	_countofArray=count _RoadSpawns;
};	
//systemChat format["%1",_RoadSpawns];
_countofArray=0;
while {_NotRoadIterations!=_countofArray} do {
	_Pos=[_TriggerArea,1] call rScripts_fnc_ga_findsuitablespot;
	_NotRoadSpawns pushBackUnique _Pos;
	_countofArray=count _NotRoadSpawns;
};	
//systemChat format["%1",_NotRoadSpawns];
_countofArray=0;
while {_AnythingSpawnIterations!=_countofArray} do {
	_Pos=[_TriggerArea,2] call rScripts_fnc_ga_findsuitablespot;
	_AllSpawns pushBackUnique _Pos;
	_countofArray=count _AllSpawns;
};
//systemChat format["%1",_AllSpawns];
//Spawn in random vechiles and squads, after being spawned delete it as a possible location from the spawn list


_spawnsLeft=[_VicOnRoadStatus,_MaxVic,_randomVehicleArray,true,_RoadSpawns,_NotRoadSpawns,_AllSpawns,_TriggerArea] call rScripts_fnc_ga_spawnloop;
//systemChat format["%1",_spawnsLeft];
_RoadSpawns=_spawnsLeft select 0;
_NotRoadSpawns=_spawnsLeft select 1;
_AllSpawns=_spawnsLeft select 2;
_spawnsLeft=[_InfOnRoadStatus,_MaxNumofSquads,_randomInfantryArray,true,_RoadSpawns,_NotRoadSpawns,_AllSpawns,_TriggerArea] call rScripts_fnc_ga_spawnloop;
//systemChat format["%1",_spawnsLeft];
_RoadSpawns=_spawnsLeft select 0;
_NotRoadSpawns=_spawnsLeft select 1;
_AllSpawns=_spawnsLeft select 2;
_spawnsLeft=[_IglaOnRoadStatus,_MaxIGLATurret,_IglaTurret,false,_RoadSpawns,_NotRoadSpawns,_AllSpawns,_TriggerArea] call rScripts_fnc_ga_spawnloop;
//systemChat format["%1",_spawnsLeft];
_RoadSpawns=_spawnsLeft select 0;
_NotRoadSpawns=_spawnsLeft select 1;
_AllSpawns=_spawnsLeft select 2;
_spawnsLeft=[_RadarGuidedGunStatus,_MaxRadarGuidedGun,_RadarGuidedGun,true,_RoadSpawns,_NotRoadSpawns,_AllSpawns,_TriggerArea] call rScripts_fnc_ga_spawnloop;
//systemChat format["%1",_spawnsLeft];
_RoadSpawns=_spawnsLeft select 0;
_NotRoadSpawns=_spawnsLeft select 1;
_AllSpawns=_spawnsLeft select 2;
