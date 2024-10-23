
#include "..\script_component.hpp";

private _state = param [0, "", [""]];

if (_state == "init") then {

    player execVM "mScripts\Markers\hideMarkers.sqf";

	player setVariable ["instructor", true];

	[] call FUNC(tools);
	[] call FUNC(pauseEx);
	[] call FUNC(wallHacks);
	[] call FUNC(timeSkip);
	[] call FUNC(resourcesCadre);

	[] call FUNC(3DIcons);
	[] call FUNC(timer);

	sleep 1;

	player setUnitTrait ["CamouflageCoef", 0.1];
	player setUnitTrait ["AudibleCoef", 0.1];
	player setUnitTrait ["LoadCoef", 0.1];
	player setUnitTrait ["uavHacker", true];
	player setVariable ["ace_advanced_fatigue_performanceFactor", 2, true];
	player setVariable ["ace_medical_damageThreshold", 10, true];
	player setVariable ["ace_isEngineer", 2, true];
	player setVariable ["ACE_isEOD", 2, true];
	player setVariable ["ace_medical_medicClass", 2, true];

};

if (_state == "respawn") then {

	player setUnitTrait ["CamouflageCoef", 0.1];
	player setUnitTrait ["AudibleCoef", 0.1];
	player setUnitTrait ["LoadCoef", 0.1];
	player setUnitTrait ["uavHacker", true];
	player setVariable ["ace_advanced_fatigue_performanceFactor", 2, true];
	player setVariable ["ace_medical_damageThreshold", 10, true];
	player setVariable ["ace_isEngineer", 2, true];
	player setVariable ["ACE_isEOD", 2, true];
	player setVariable ["ace_medical_medicClass", 2, true];

	player setVariable ["instructor", true];

	[] call FUNC(tools);
	[] call FUNC(pauseEx);
	[] call FUNC(timeSkip);
	[] call FUNC(resourcesCadre);

	[] call FUNC(wallHacks);

};
