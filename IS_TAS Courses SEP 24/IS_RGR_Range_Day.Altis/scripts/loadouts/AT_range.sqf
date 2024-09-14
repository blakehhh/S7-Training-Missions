_unit = _this select 1;

[_unit] execVM "scripts\loadouts\clearLoadout.sqf";

sleep 0.2;

_unit addWeapon "launch_MRAWS_green_F";
_unit addBackpack "B_Carryall_cbr";
for "_i" from 1 to 1 do {_unit addMagazine "MRAWS_HEAT_F"};
for "_i" from 1 to 3 do {_unit addMagazine "MRAWS_HEAT_F"};

_unit selectWeapon (secondaryWeapon _unit);

sleep 0.5;

/*private _safedWeapons = _unit getVariable ["ace_safemode_safedWeapons", []];
if(!((currentWeapon _unit) in _safedWeapons)) then {
    [_unit, currentWeapon _unit, currentMuzzle _unit] call ace_safemode_fnc_lockSafety;
};
