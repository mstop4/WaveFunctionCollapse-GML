/// @arg raw_tile_data

var _raw_tile_data = argument[0];
var _final_tile_data = ds_map_create();

var _tiles = _raw_tile_data[? "tiles"];
var _len = ds_list_size(_tiles);
var _final_tiles = ds_list_create();
ds_map_add_list(_final_tile_data, "tiles", _final_tiles);

// Generate full tile data from raw tile and symmetry data
for (var i=0; i<_len; i++) {
	var _cur_tile = _tiles[| i];
	var _symmetry = _cur_tile[? "symmetry"];
	var _tile_id = _cur_tile[? "tileId"];
	var _sides = _cur_tile[? "sides"];
	
	var _symmetry_data = symmetry_data[_symmetry];
	var _tile_configs = ds_list_create();
	
	// Generate tile symmetries
	for (var j=0; j<8; j++) {
		var _cur_config_index = _symmetry_data[j];

		// Check tile cache
		if (_cur_config_index < ds_list_size(_tile_configs)) {
			ds_list_add(_final_tiles, _tile_configs[| _cur_config_index]);
		} else {
			var _new_tile = ds_map_create();
			_new_tile[? "tileId"] = _tile_id;
			var _new_sides = ds_list_create();
			ds_list_copy(_new_sides, _sides);
			
			if (j & 1) tile_neighbours_rotate(_new_sides);
			if (j & 2) tile_neighbours_flip(_new_sides);
			if (j & 4) tile_neighbours_mirror(_new_sides);
			
			ds_map_add_list(_new_tile, "sides", _new_sides);
			ds_list_add(_tile_configs, _new_tile);
			ds_list_add(_final_tiles, _new_tile);
		}
		var _last_added = ds_list_size(_final_tiles) - 1;
		ds_list_mark_as_map(_final_tiles, _last_added);
	}
	ds_list_destroy(_tile_configs);
}

return _final_tile_data;