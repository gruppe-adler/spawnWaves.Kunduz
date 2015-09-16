_classname = _this select 0;
_group = _this select 1;
_distance = _this select 2;
_vector = _this select 3;
_targetposition = _this select 4;

_position = [_targetposition, [_distance,_distance], _vector] call SHK_pos;

hintSilent format ["unit created at %1",_position];

_unit = _classname createUnit [_position, _group];

sleep 1;