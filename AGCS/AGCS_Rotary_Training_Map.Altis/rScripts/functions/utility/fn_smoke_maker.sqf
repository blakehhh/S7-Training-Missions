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

// Initialize variables
_smoketype = "";
_sunrisetime = 8.00;
_sunsettime = 17.00;
_daytimevalue = daytime;

// Check if it's nighttime
_cond = _daytimevalue < _sunrisetime || _daytimevalue > _sunsettime;
if (_cond) then {
    // Select a smoke type for nighttime
    _smoketype = selectRandom ["NVG_TargetC"];
} else {
    // Select a smoke type for daytime
    _smoketype = selectRandom [
        "SmokeShellGreen_Infinite",
        "SmokeShellYellow_Infinite",
        "SmokeShellPurple_Infinite",
        "SmokeShellBlue_Infinite"
    ];
}

// Create smoke at the specified location
_smoker = createVehicle [_smoketype, getPos _location, [], 0, "FLY"];  
