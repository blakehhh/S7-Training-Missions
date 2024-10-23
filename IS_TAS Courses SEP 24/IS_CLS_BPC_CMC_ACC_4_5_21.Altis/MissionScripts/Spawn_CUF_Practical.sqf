"rhsgref_ins_machinegunner" createUnit [[26912.34,21640.549,0], createGroup east];
private _MGgunner = ([26912.34,21640.549,0] nearestObject "rhsgref_ins_machinegunner");
(group _MGgunner) setFormDir 247.196;
(group _MGgunner) setCombatMode "RED";
_MGgunner setUnitPos "MIDDLE";
_MGgunner disableAI "PATH";
_MGgunner disableAI "COVER";

"rhsgref_ins_sniper" createUnit [[27036.574,21484.18,48.228], createGroup east];
private _Sgunner = ([27036.574,21484.18,48.228] nearestObject "rhsgref_ins_sniper");
_Sgunner SetPos [27036.574,21484.18,48.228];
(group _Sgunner) setFormDir 247.196;
(group _Sgunner) setCombatMode "RED";
_Sgunner setUnitPos "MIDDLE";
_Sgunner disableAI "PATH";
_Sgunner disableAI "COVER";

"rhsgref_ins_arifleman_rpk" createUnit [[26855.088,21586.027,0.35], createGroup east];
private _Wgunner = ([26855.088,21586.027,0.35] nearestObject "rhsgref_ins_arifleman_rpk");
_Wgunner SetPos [26855.088,21586.027,0.35];
(group _Wgunner) setCombatMode "RED";
(group _Wgunner) setFormDir 264.835;
_Wgunner setUnitPos "UP";
_Wgunner disableAI "PATH";
_Wgunner disableAI "COVER";

"rhsgref_ins_rifleman_akm" createUnit [[26863.313,21601.652,0.195], createGroup east];
private _Wgunner2 = ([26863.313,21601.652,0.195] nearestObject "rhsgref_ins_rifleman_akm");
_Wgunner2 SetPos [26863.313,21601.652,0.195];
(group _Wgunner2) setCombatMode "RED";
(group _Wgunner2) setFormDir 261.737;
_Wgunner2 setUnitPos "UP";
_Wgunner2 disableAI "PATH";
_Wgunner2 disableAI "COVER";

private _gunner = [_MGgunner,_Wgunner,_Wgunner2,_Sgunner];
waitUntil {player inArea cls_cuf1_trigger};
while {player inArea cls_cuf1_trigger} do 
{
    sleep (8 + random 8);
    (selectRandom [_Wgunner,_Wgunner2,_Sgunner]) doSuppressiveFire cls_target;
	_MGgunner doSuppressiveFire cls_target;
};
while {player inArea cls_cuf1_trigger} do 
{
	sleep 2;
    {_x setUnitPos "UP"} ForEach [_Wgunner,_Wgunner2];
    {_x setUnitPos "MIDDLE"} forEach [_MGgunner,_Sgunner];
	{_x disableAI "PATH"; _x disableAI "COVER";} forEach _gunner;
};