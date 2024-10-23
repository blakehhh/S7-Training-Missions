waitUntil {!isNull player};

null = [player] execVM "MissionScripts\InitLocalMarkers.sqf";
player allowDamage false;

addMissionEventHandler ["Draw3D",
	{
		if ((typeOf player == "Cav_B_C_SquadLeader_Bandit_2_F") or (typeOf player == "Cav_B_C_SquadLeader_Bandit_1_F")) then {
			{			
				if ((side _x == east) and ((_x distance player) < 1000)) then			
				{				
					// Passed parameters to the 3D icon draw function : 
					// - unit type icon from the Cfg
					// - the assigned team color R,G,B at a moderate 0.5 transparency
					// - the unit's X,Y height of 1 meter
					// - normal width
					// - normal height
					// - no rotation
					// - player's in-game name under the icon
					drawIcon3D[getText (configFile >> "CfgVehicles" >> typeOf _x >> "icon"),[1,0,0,0.5],[getPos _x select 0,getPos _x select 1,(getPos _x select 2)+3],1,1,0, str (floor(_x distance player))];
				};			
			} foreach allUnits;
		};
	}];