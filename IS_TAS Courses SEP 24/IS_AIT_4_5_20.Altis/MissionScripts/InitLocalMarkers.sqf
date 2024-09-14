waitUntil {!isNull player};
_unit = _this select 0;

if ((typeOf _unit == "Cav_B_C_SquadLeader_Bandit_2_F") or (typeOf _unit == "Cav_B_C_SquadLeader_Bandit_1_F") or (typeOf _unit == "Cav_B_C_AlphaFireTeamLeader_F") or (typeOf _unit == "Cav_B_C_BravoFireTeamLeader_F")) then
{
		_mrk11 = createMarkerLocal["mrk_stx_11",getMarkerPos "stx_1_start"];
		_mrk11 setMarkerTextLocal "START";
		_mrk11 setMarkerColorLocal "ColorBLUE";
		_mrk11 setMarkerDirLocal 160;
		_mrk11 setMarkerTypeLocal "mil_start";		
		
		_mrk12 = createMarkerLocal["mrk_stx_12",getMarkerPos "stx_1_sbf"];
		_mrk12 setMarkerTextLocal "SBF";
		_mrk12 setMarkerColorLocal "ColorBLUE";
		_mrk12 setMarkerDirLocal 45;
		_mrk12 setMarkerTypeLocal "mil_ambush";		
		
		_mrk13 = createMarkerLocal["mrk_stx_13",getMarkerPos "stx_1_ap"];
		_mrk13 setMarkerTextLocal "AP";
		_mrk13 setMarkerColorLocal "ColorBLUE";
		_mrk13 setMarkerDirLocal 40;
		_mrk13 setMarkerTypeLocal "mil_ambush";		
		
		_mrk21 = createMarkerLocal["mrk_ftx_21",getMarkerPos "ftx_1_start"];
		_mrk21 setMarkerTextLocal "START";
		_mrk21 setMarkerColorLocal "ColorBLUE";
		_mrk21 setMarkerDirLocal 255;
		_mrk21 setMarkerTypeLocal "mil_start";		
		
		_mrk22 = createMarkerLocal["mrk_ftx_22",getMarkerPos "ftx_1_sbf"];
		_mrk22 setMarkerTextLocal "SBF";
		_mrk22 setMarkerColorLocal "ColorBLUE";
		_mrk22 setMarkerDirLocal 230;
		_mrk22 setMarkerTypeLocal "mil_ambush";		
		
		_mrk23 = createMarkerLocal["mrk_ftx_23",getMarkerPos "ftx_1_ap"];
		_mrk23 setMarkerTextLocal "AP";
		_mrk23 setMarkerColorLocal "ColorBLUE";
		_mrk23 setMarkerDirLocal 270;
		_mrk23 setMarkerTypeLocal "mil_ambush";		
		
		_mrk31 = createMarkerLocal["mrk_ftx_31",getMarkerPos "ftx_2_start"];
		_mrk31 setMarkerTextLocal "START";
		_mrk31 setMarkerColorLocal "ColorBLUE";
		_mrk31 setMarkerDirLocal 120;
		_mrk31 setMarkerTypeLocal "mil_start";		
		
		_mrk32 = createMarkerLocal["mrk_ftx_32",getMarkerPos "ftx_2_sbf"];
		_mrk32 setMarkerTextLocal "SBF";
		_mrk32 setMarkerColorLocal "ColorBLUE";
		_mrk32 setMarkerDirLocal 90;
		_mrk32 setMarkerTypeLocal "mil_ambush";		
		
		_mrk33 = createMarkerLocal["mrk_ftx_33",getMarkerPos "ftx_2_ap"];
		_mrk33 setMarkerTextLocal "AP";
		_mrk33 setMarkerColorLocal "ColorBLUE";
		_mrk33 setMarkerDirLocal 70;
		_mrk33 setMarkerTypeLocal "mil_ambush";		
	};