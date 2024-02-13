#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles the lights turning on and off in a given radius
 *
 * Arguments:
 * 0: _lightDamage - Damage for the light. 0.95 will turn off the light, 0 will turn it back on
 * 1: _distance - The range of meters for turning lights on or off
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call rScripts_fnc_turnofflights
 *
 * Public: No
 */
params ["_lightDamage", "_distance"];

// Ensure default values for parameters
_onoff = [_this, 0, _lightDamage, [0]] call BIS_fnc_param;    
_distance = [_this, 1, _distance, [0]] call BIS_fnc_param;    
_marker = [_this, 2, getMarkerPos "lightsmarker", ["",[],objNull]] call BIS_fnc_param;    

// List of light types to consider
_types = [    
    "Lamps_Base_F",    
    "Land_LampAirport_F",    
    "Land_LampSolar_F",    
    "Land_LampStreet_F",    
    "Land_LampStreet_small_F",    
    "PowerLines_base_F",    
    "Land_LampDecor_F",    
    "Land_LampHalogen_F",    
    "Land_LampHarbour_F",    
    "Land_LampShabby_F",    
    "Land_PowerPoleWooden_L_F",    
    "Land_NavigLight",    
    "Land_runway_edgelight",    
    "Land_runway_edgelight_blue_F",    
    "Land_Flush_Light_green_F",    
    "Land_Flush_Light_red_F",    
    "Land_Flush_Light_yellow_F",    
    "Land_Runway_PAPI",    
    "Land_Runway_PAPI_2",    
    "Land_Runway_PAPI_3",    
    "Land_Runway_PAPI_4",    
    "Land_fs_roof_F",    
    "Land_fs_sign_F"    
];    

// Loop through each light type and apply damage to turn them on or off
for [{_i=0},{_i<(count _types)},{_i=_i+1}] do {    
   _lamps = _marker nearObjects [_types select _i, _distance];    
   {_x setDamage _onoff} forEach _lamps;    
};
