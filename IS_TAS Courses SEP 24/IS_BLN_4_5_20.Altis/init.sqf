#include "cScripts\script_component.hpp"
/*
 * Author: CPL.Brostrom.A
 * This is the mission init.sqf this is run witout exceptions on mission start.
 * Some sections in this script only run when your on a multiplayer enviroment to avoid errors and issues.
 * Read more about Initzialisation order here: https://community.bistudio.com/wiki/Initialization_Order
 */

if (!isMultiplayer) then {SHOW_CHAT_WARNING("", "Mission is running on singelplayer enviroment!");};
#ifdef DEBUG_MODE
    SHOW_INFO("init", "Initializing...");
    SHOW_CHAT_INFO_1("init", "cScripts Version %1 is running.", VERSION);
    SHOW_CHAT_WARNING("init", "Debug mode is currently active.");
    logEntities;
#endif

enableSaving [false, false];

// To Turns off or on ambient Wildelife, Ambient Sounds and wind sound strenght.
enableEnvironment [false, true, 1];

ACE_maxWeightCarry = 7500;
ACE_maxWeightDrag = 10000;

INFO("init", "Initialization completed.");

/* APPLY STUFF ONLY BELOW THIS LINE */

#include "tScripts\script_component.hpp"

if(isServer) then {

    [] call FUNC(grassCutter);

    if(!isMultiplayer) then {
        {if(!(isPlayer _x)) then {deleteVehicle _x}} foreach allUnits;
    };

    {_x setObjectTextureGlobal [0, "z\cav\addons\flag\data\flag_00_ca.paa"]} foreach allMissionObjects "Land_InfoStand_V2_F";
    {_x setObjectTextureGlobal [0, "Data\MissionLogo.paa"]} foreach allMissionObjects "Land_Billboard_F";
    {_x setObjectTextureGlobal [0, "Data\MissionLogo.paa"]} foreach allMissionObjects "Land_PCSet_01_screen_F";
    {_x setObjectTextureGlobal [0, "Data\MissionLogo.paa"]} foreach allMissionObjects "Land_Laptop_unfolded_F";

};

[] call FUNC(vehicleInit);

[missionNameSpace, ["showLanes", false]] remoteExec ["setvariable", 0, true];
[missionNameSpace, ["showTerrainAssociation", false]] remoteExec ["setvariable", 0, true];