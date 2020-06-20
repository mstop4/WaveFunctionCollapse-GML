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
	var _tile_id = _cur_tile[? "tileId"];

	var _symmetry = _cur_tile[? "symmetry"];
	var _sides = _cur_tile[? "sides"];
	
	var _symmetry_data = symmetry_data[_symmetry];
	var _exemplar_data = exemplar_tiles[_symmetry];
	var _exemplar_list = ds_list_create();
	
	// Generate exemplar tiles
	for (var j=0; j<8; j++) {
		if (_exemplar_data[j] > -1) {	
			var _weight = is_undefined(_cur_tile[? "weight"]) ? 1 : _cur_tile[? "weight"];
			
			var _new_tile = ds_map_create();
			_new_tile[? "tileId"] = _tile_id;
			_new_tile[? "transforms"] = j;
			_new_tile[? "weight"] = base_weight[_symmetry] * _weight;
			var _new_sides = ds_list_create();
			ds_list_copy(_new_sides, _sides);

			if (j & 4) tile_neighbours_mirror(_new_sides);
			if (j & 2) tile_neighbours_flip(_new_sides);
			if (j & 1) tile_neighbours_rotate(_new_sides);
			
			ds_map_add_list(_new_tile, "sides", _new_sides);
			ds_list_add(_exemplar_list, _new_tile);
		}
	}

	// Assign exemplar tiles based on symmetry data
	for (var j=0; j<8; j++) {
		var _cur_symmetry_index = _symmetry_data[j];

		// Check tile cache
		if (_cur_symmetry_index == _exemplar_data[j]) {
			ds_list_add(_final_tiles, _exemplar_list[| _cur_symmetry_index]);
		}
		var _last_added = ds_list_size(_final_tiles) - 1;
		ds_list_mark_as_map(_final_tiles, _last_added);
	}
	ds_list_destroy(_exemplar_list);
}

return _final_tile_data;