
waitUntil {!isNull player};

player allowDamage false;

player addEventHandler ["InventoryClosed", {
	params ["_unit", "_container"];
	if ((typeOf _container) == "GroundWeaponHolder") then {
		deleteVehicle _container
	};
}];