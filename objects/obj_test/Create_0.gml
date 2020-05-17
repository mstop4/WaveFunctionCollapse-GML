init_enums();

create_test_tiles();
init_symmetries();

raw_tile = ds_map_create();

var _side_groups = ds_list_create();
_side_groups[| 0] = 0;
ds_map_add_list(raw_tile, "sideGroups", _side_groups);

raw_tile[? "symmetry"] = SYMMETRY.X;

var _neighbours = ds_list_create();

for (var i=0; i<4; i++) {
	var _side_neighbours = ds_map_create();
	var _side_neighbour_groups = ds_list_create();
	
	_side_neighbour_groups[| 0] = 0;
	ds_map_add_list(_side_neighbours, "sideGroups", _side_neighbour_groups);
	_neighbours[| i] = _side_neighbours;
	ds_list_mark_as_map(_neighbours, i);
}

ds_map_add_list(raw_tile, "neighbours", _neighbours);

var _json = json_encode(raw_tile);
show_debug_message(_json);