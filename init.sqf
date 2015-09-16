waveInit = false;

[] execVM "GRAD_waveSpawn\init.sqf";

waitUntil {
  waveInit
};

unitList_01 = [
"rhs_vdv_rifleman",
"rhs_vdv_at",
"rhs_vdv_medic",
"rhs_vdv_officer"
];

sleep 5;

hintSilent "starting...";
if (!hasInterface && !isDedicated) then {
		// einheitenarray, multiplikator, pause vor beginn, anzahl wellen, pause zwischen wellen, entfernung, richtung ([0,180] = ost), zielmarker
	    [unitList_01,5,5,5,15,200,[0,270],"mrk_center"] execVM "GRAD_waveSpawn\programWave.sqf"; // run spawn script
	} else {
if (isServer) then {
     [unitList_01,5,5,5,15,200,[0,270],"mrk_center"] execVM "GRAD_waveSpawn\programWave.sqf"; // run fallback for use without HC
	};
};



/*
  _units = _this select 0;
  _multiplier = _this select 1;
  _initDelay = _this select 2;
  _waveCount = _this select 3;
  _delayBetween = _this select 4;
  _spawnDistance = _this select 5;
  _spawnVector = _this select 6;  // eg [0,180] or random 360
  _targetMarker = _this select 7; // position to assault

*/