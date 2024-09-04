
#include "..\script_component.hpp";

params ["_box",["_locked", false]];

//[_box, true] call ace_arsenal_fnc_initBox;

[_box,"none",true,true,false,true] call cScripts_fnc_doStarterCrate;

if (_locked == true) then {
	_box setVariable ["locked", true];
};

_kits = [
	["Instructor", true],
	["NavigationMicroDAGR"]
];

{
	_x params ["_kit", "_instr"];
	[_box, _instr] call compile preProcessFile format ["tScripts\Crates\Kits\fn_kit%1.sqf", _kit];
} forEach _kits;

[_box, -1] call ace_cargo_fnc_setSize;

[_box, false] call ace_dragging_fnc_setDraggable;
[_box, false] call ace_dragging_fnc_setCarryable;

_box allowdamage false;

_box call FUNC(crateLock);

if !(isServer) exitWith {};

[_box, [
    ["ACE_MicroDAGR", 12]
]] call FUNC(setCargo);
