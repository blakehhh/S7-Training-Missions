#include "..\script_component.hpp";
/*
 * Author: CW3.Sparrow.P
 * This function handles when you select an option from the table how it behaves
 *
 * Arguments:
 * 0: thisTrigger
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call rScripts_fnc_slinglz_placer
 *
 * Public: No
 *
 */
 if (!isServer) exitWith {};
IFR_SELECTOR addAction ["ARE Task 3: IFR Start",  {call rScripts_fnc_ifr_start;}];  
IFR_SELECTOR addAction ["STOP ARE Task 3: IFR STOP",{call rScripts_fnc_ifr_end;}]; 
 