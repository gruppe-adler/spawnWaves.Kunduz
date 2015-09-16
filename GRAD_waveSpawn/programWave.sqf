_units = _this select 0;
_multiplier = _this select 1;
_initDelay = _this select 2;
_waveCount = _this select 3;
_delayBetween = _this select 4;
_spawnDistance = _this select 5;
_spawnVector = _this select 6;  // eg [0,180] or random 360
_targetMarker = _this select 7; // position to assault

sleep _initDelay;
hintSilent "init sleep done";
for [{_j=0}, {_j<_waveCount}, {_j=_j+1}] do
{
		
		for [{_i=0}, {_i<_multiplier}, {_i=_i+1}] do {
		 	_group = createGroup civilian;
		 	{ 

		 	[_x, _group, _spawnDistance, _spawnVector, (getMarkerPos _targetMarker)] execVM  "GRAD_waveSpawn\spawnThatShit.sqf"; 
		 	sleep 0.1;
		 	} forEach _units;

		 	_wp =_group addWaypoint [(getMarkerPos _targetMarker), 0];
			[_group, 0] setWaypointType "MOVE";
			_group setBehaviour "AWARE";
			// hintSilent format ["units sent to %1",(getMarkerPos _targetMarker)];
			sleep 0.5;	
	};
sleep _delayBetween;
};