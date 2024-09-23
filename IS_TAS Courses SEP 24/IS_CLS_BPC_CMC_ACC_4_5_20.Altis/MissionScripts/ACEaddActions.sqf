//Adds a categories to the menu
private _CUF = ["CLS: Care Under Fire", "CLS: Care Under Fire", "\z\ACE\addons\medical_gui\ui\grave.paa", {[]}, {true}] call ace_interact_menu_fnc_createAction; 
[_this,1,["ACE_SelfActions"], _CUF] call ace_interact_menu_fnc_addActionToObject;

private _bonebreaker9000 = ["Bone Breaker 9000", "Bone Breaker 9000", "\z\ACE\addons\medical_gui\ui\splint.paa", {[]}, {true}] call ace_interact_menu_fnc_createAction; 
[_this,1,["ACE_SelfActions"], _bonebreaker9000] call ace_interact_menu_fnc_addActionToObject;

//Adds option to start CUF Range
private _startCUF = ["cScriptsHealAce", "Spawn CUF Range 1", "\z\ACE\addons\medical_gui\ui\grave.paa", {execVM "MissionScripts\Spawn_CUF_Practical.sqf"}, {true}] call ace_interact_menu_fnc_createAction; 
[_this,1,["ACE_SelfActions", "CLS: Care Under Fire"], _startCUF] call ace_interact_menu_fnc_addActionToObject;

//adds 4 Fractures Target AI/Player
private _reFracAction = ["cScriptsHealAce", "Fracture Target Player/AI w/ 4 Fracs", "\z\ACE\addons\medical_gui\ui\cross.paa", {private _unit = cursorTarget;  
private _frac = [0,0,1,1,1,1];  
_unit setVariable ["ace_medical_fractures", _frac, true];  
{  
  if (_x == 1) then {  
    ["ace_medical_fracture", [_unit, _forEachIndex], _unit] call CBA_fnc_targetEvent;  
  }  
} forEach _frac
}, {true}] call ace_interact_menu_fnc_createAction; 
[_this,1,["ACE_SelfActions", "Bone Breaker 9000"], _reFracAction] call ace_interact_menu_fnc_addActionToObject;

//adds 4 Random Fractures Target AI/Player
private _reFracAction = ["cScriptsHealAce", "Fracture Target Player/AI w/ Random Fracs", "\z\ACE\addons\medical_gui\ui\cross.paa", {private _unit = cursorTarget;  
private _frac = [0,0,selectRandom [0,1],selectRandom [0,1],selectRandom [0,1],selectRandom [0,1]];  
_unit setVariable ["ace_medical_fractures", _frac, true];  
{  
  if (_x == 1) then {  
    ["ace_medical_fracture", [_unit, _forEachIndex], _unit] call CBA_fnc_targetEvent;  
  }  
} forEach _frac
}, {true}] call ace_interact_menu_fnc_createAction; 
[_this,1,["ACE_SelfActions", "Bone Breaker 9000"], _reFracAction] call ace_interact_menu_fnc_addActionToObject;

//bonus script for healing players/AI with ease
private _reHealAction = ["cScriptsHealAce", "PAK Heal Target Player/AI", "\z\ACE\addons\medical_gui\ui\cross_t_9.paa", { [player, cursorTarget] call ace_medical_treatment_fnc_fullHeal }, {true}] call ace_interact_menu_fnc_createAction; 
[_this,1,["ACE_SelfActions"], _reHealAction] call ace_interact_menu_fnc_addActionToObject;