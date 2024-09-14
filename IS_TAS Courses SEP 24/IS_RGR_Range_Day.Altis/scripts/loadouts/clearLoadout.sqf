_unit = _this select 0;

_unit setVehicleAmmo 0;

sleep 0.1;

_unit removeWeapon (primaryWeapon _unit);

_unit removeWeapon (secondaryWeapon _unit);

_unit removeWeapon (handgunWeapon _unit);

removeBackpack _unit;
