_unit = _this select 1;

[_unit] execVM "scripts\loadouts\clearLoadout.sqf";

sleep 0.2;


_unit addWeapon "UK3CB_P320_DES";
for "_i" from 1 to 2 do {_unit addMagazine ["UK3CB_P320_9X19_17Rnd", 10];};
//for "_i" from 1 to 2 do {_unit addMagazine ["UK3CB_P320_9X19_17Rnd", 0];};

_unit selectWeapon (handgunWeapon _unit);

sleep 0.5;

/*private _safedWeapons = _unit getVariable ["ace_safemode_safedWeapons", []];
if(!((currentWeapon _unit) in _safedWeapons)) then {
    [_unit, currentWeapon _unit, currentMuzzle _unit] call ace_safemode_fnc_lockSafety;
};

