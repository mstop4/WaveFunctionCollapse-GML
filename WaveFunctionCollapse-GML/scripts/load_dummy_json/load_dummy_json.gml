var _raw_tile = ds_map_create();

_raw_tile[? "symmetry"] = "X";
_raw_tile[? "tileId"] = 1;

var _sides = ds_list_create();

for (var i=0; i<4; i++) {
	var _side_map = ds_map_create();
	var _side_groups = ds_list_create();
	var _neighbours = ds_list_create();
	
	_side_groups[| 0] = 0;
	_neighbours[| 0] = 0;
	ds_map_add_list(_side_map, "sideGroups", _side_groups);
	ds_map_add_list(_side_map, "neighbours", _neighbours);
	_sides[| i] = _side_map;
	ds_list_mark_as_map(_sides, i);
}

ds_map_add_list(_raw_tile, "sides", _sides);
return _raw_tile;