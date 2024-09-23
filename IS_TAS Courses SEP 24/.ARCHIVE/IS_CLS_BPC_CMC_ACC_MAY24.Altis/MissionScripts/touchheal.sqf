private _reFracAction = ["cScriptsHealAce", "Fracture Closest Dummy", "\z\ACE\addons\medical_gui\ui\cross.paa", {private _unit = nearestObject [player, "rhsusf_army_ocp_rifleman"];  
private _frac = [0,0,1,1,1,1];  
_unit setVariable ["ace_medical_fractures", _frac, true];  
{  
  if (_x == 1) then {  
    ["ace_medical_fracture", [_unit, _forEachIndex], _unit] call CBA_fnc_targetEvent;  
  }  
} forEach _frac
}, {true}] call ace_interact_menu_fnc_createAction; 
[_this,1,["ACE_SelfActions"], _reFracAction] call ace_interact_menu_fnc_addActionToObject;

private _reFracAction = ["cScriptsHealAce", "Fracture Target Player/AI", "\z\ACE\addons\medical_gui\ui\cross.paa", {private _unit = cursorTarget;  
private _frac = [0,0,1,1,1,1];  
_unit setVariable ["ace_medical_fractures", _frac, true];  
{  
  if (_x == 1) then {  
    ["ace_medical_fracture", [_unit, _forEachIndex], _unit] call CBA_fnc_targetEvent;  
  }  
} forEach _frac
}, {true}] call ace_interact_menu_fnc_createAction; 
[_this,1,["ACE_SelfActions"], _reFracAction] call ace_interact_menu_fnc_addActionToObject;

private _reHealAction = ["cScriptsHealAce", "PAK Heal Target Player/AI", "\z\ACE\addons\medical_gui\ui\cross.paa", { [player, cursorTarget] call ace_medical_treatment_fnc_fullHeal }, {true}] call ace_interact_menu_fnc_createAction; 
[_this,1,["ACE_SelfActions"], _reHealAction] call ace_interact_menu_fnc_addActionToObject;