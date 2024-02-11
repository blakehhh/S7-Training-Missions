#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles placement of smoke for different tasks
 *
 * Arguments:
 * 0: Location <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call rScripts_fnc_civ_damage
 *
 * Public: No
 */

params ["_location"];
//
//_location=player;
_smoketype="";

 _sunrisetime=8.00;
 _sunsettime=17.00;
_daytimevalue=daytime;
_cond=_daytimevalue < _sunrisetime || _daytimevalue > _sunsettime;
if (_cond) then {
	_smoketype=selectRandom ["NVG_TargetC"];
	//systemChat "Return True";
}
else {
_smoketype = selectRandom [ 
"SmokeShellGreen_Infinite", 
"SmokeShellYellow_Infinite", 
"SmokeShellPurple_Infinite", 
"SmokeShellBlue_Infinite"
]; 
//systemChat "Return False";
};

//systemChat format["%1",_smoketype];
//systemChat format["%1",_daytimevalue];
//systemChat format["%1",_sunrisetime];
//systemChat format["%1",_cond];
_smoker = createVehicle [_smoketype,getpos _location,[],0,"FLY"];  
//deleteVehicle _smoker; 
//systemChat format ["Smoke Spawned"];
