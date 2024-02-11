#include "script_component.hpp";
/*
 * Author: CPL.Brostrom.A
 * This is the rules set for the mission using the cba XEH. Each setting here is alterd via cbaSettings
 */
if (is3DEN) exitWith {};

INFO("postInit", "Initializing...");

call rScripts_fnc_tightlz_placer;
call rScripts_fnc_slinglz_placer;
call rScripts_fnc_ifr_placer;
call rScripts_fnc_ga_placer;

INFO("postInit", "rScripts initialized.");