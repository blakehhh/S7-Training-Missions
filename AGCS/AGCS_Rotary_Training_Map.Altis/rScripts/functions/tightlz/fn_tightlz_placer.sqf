#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles the creation of actions on the tight lz table
 *
 * Arguments:
 * 
 * 
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call rScripts_fnc_tightlz_placer
 *
 * Public: No
 *
 */

_randomLZArray=[];
_townArray=[];
_townLZs=[];
_act = "[thisTrigger] call rScripts_fnc_smoke_maker";
_deact = format ["[%1,thisTrigger] call rScripts_fnc_tightlz_deact",_townLZs];
//Gets a list of all the triggers named tight_lz_#
{ 
    private _markerName = vehicleVarName _x;

    private _markerName = [_markerName, 0, 8] call BIS_fnc_trimString;
    //systemChat format ["%1",_markerName];
    
    if (toUpper _markerName=='TIGHT_LZ_') then 
        {
            _randomLZArray pushBack _x;
        };

    
}forEach allMissionObjects "EmptyDetector"; 

//Gets a list of towns to seperate them
{
    //systemChat format ["Start of town filtering"];
    _findThis="_";
    //systemChat format ["%1",_x];
    _nameOfVar=vehicleVarName _x;
    _underscoreLocation= _nameOfVar find [_findThis,9];
    //systemChat format ["%1",_underscoreLocation];
    private _townname = [_nameOfVar,9,_underscoreLocation-1] call BIS_fnc_trimString;
    _townArray pushBackUnique _townname;
    //systemChat format ["%1",_townName];
}forEach _randomLZArray;
//Splits each set of tight LZs by town any applies the trigger by town

{
    _townLZs=[];
    _townFilter=_x;
    //systemChat format ["%1",_townFilter];
    //systemChat format ["Heelo"];
    {
        //systemChat format ["Filtering Town: %1",_townFilter];
        private _markerName = vehicleVarName _x;
        _findThis="_";
        _underscoreLocation= _markerName find [_findThis,9];
        private _townname = [_markerName,9,_underscoreLocation-1] call BIS_fnc_trimString;
        //_townname="";
        //systemChat format ["markerName: %1",_townFilter];
        //systemChat format ["townname: %1",_townname];
        if (toUpper _townname isEqualTo toUpper _townFilter) then 
        {
            _townLZs pushBack _x;
        };
    } forEach _randomLZArray;
    //Adds Options to the start up table
    _title=format ["ARE Task 1: Tight LZs %1",_townFilter];
    _start=format ["[%1,'%2'] call rScripts_fnc_tightlz_startaction;",_townLZs,_townFilter];
    //systemChat _start;
    TIGHT_LZ_SELECTOR addAction [_title,_start];
    _act = "[thisTrigger] call rScripts_fnc_smoke_maker";
    _deact = format ["[%1,thisTrigger] call rScripts_fnc_tightlz_deact",_townLZs];
    {
        _x setTriggerType "NONE";
        _x setTriggerActivation ["ANYPLAYER","NOT PRESENT",true];
        _x setTriggerStatements ["this && TIGHT_LZ_SMOKE_SPAWNER inArea thisTrigger",_act,_deact];
    }forEach _townLZs;
}forEach _townArray;

TIGHT_LZ_SELECTOR addAction ["STOP ARE TASK 1: Tight LZs",   
  {    
  TIGHT_LZ_SMOKE_SPAWNER setPOS (getPOS TIGHT_LZ_HQ);    
  }  
  ];
//_act = "[thisTrigger] call rScripts_fnc_tightlz_act";
//_act="";


/*
Condition
    no player and TIGHT_LZ_SMOKE_SPAWNER inArea
On activation 
    Spawn smoke every 45 seconds
On deactivation 
    Pick new LZ
*/