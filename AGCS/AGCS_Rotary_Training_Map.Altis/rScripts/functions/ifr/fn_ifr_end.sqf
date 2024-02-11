#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function Sets the time to noon, overcast to 0 and fog to 0 along with fixing all the lights around LZ blind
 *
 * Arguments:
 * 0: thisTrigger
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call rScripts_fnc_ifr_placer;
 *
 * Public: No
 *
 */
//Sets the time to noon, overcast to 0 and fog to 0 along with fixing all the lights around LZ blind
setTimeMultiplier 1;  
skipTime ((12 - dayTime + 24) % 24); 
0 setOvercast 0;  
forceWeatherChange;
0 setFog [0,.01,200]; 
forceWeatherChange;
[0.0,200]call rScripts_fnc_turnofflights;
_objectArray=nearestObjects [getPos IFR_FINISH,[ 
 "NVG_TargetC"
] ,10];
{
    //systemChat format["%1",_x];
    deleteVehicle _x;
}forEach _objectArray;