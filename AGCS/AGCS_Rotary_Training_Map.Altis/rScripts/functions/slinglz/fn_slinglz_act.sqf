#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles gives the position to deliver the sling load
 *
 * Arguments:
 * 
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call rScripts_fnc_slinglz_act
 *
 * Public: No
 *
 */
_smokerPOS = getpos SLING_LZ_SMOKE_SPAWNER;  
_smokerGrid = mapGridPosition _smokerPOS;  
_message=format ["Drop Off Location %1",_smokerGrid]; 
[[west,"HQ"],_message] remoteExec ["sideChat",-2]; 
