#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles gives the position to deliver the sling load
 *
 * Arguments:
 * None
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

// Get the position of the SLING_LZ_SMOKE_SPAWNER
_smokerPOS = getpos SLING_LZ_SMOKE_SPAWNER;  

// Convert the position to a grid position
_smokerGrid = mapGridPosition _smokerPOS;  

// Format the message with the drop-off location
_message = format ["Drop Off Location %1", _smokerGrid]; 

// Send the message to the west side's HQ in side chat
[[west,"HQ"], _message] remoteExec ["sideChat", -2]; 
