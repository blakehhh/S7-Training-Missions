_unit = _this select 1;

[_unit] execVM "scripts\loadouts\clearLoadout.sqf";

sleep 0.2;

_unit addWeapon "rhs_weap_m249_light_L";
_unit addPrimaryWeaponItem "rhsusf_acc_saw_lw_bipod";
_unit addPrimaryWeaponItem "rhsusf_acc_ELCAN";
for "_i" from 1 to 2 do {_unit addMagazine ["rhsusf_200Rnd_556x45_M855_mixed_soft_pouch", 200];};

_unit selectWeapon (primaryWeapon _unit);

sleep 0.5;

/*private _safedWeapons = _unit getVariable ["ace_safemode_safedWeapons", []];
if(!((currentWeapon _unit) in _safedWeapons)) then {
    [_unit, currentWeapon _unit, currentMuzzle _unit] call ace_safemode_fnc_lockSafety;
};
