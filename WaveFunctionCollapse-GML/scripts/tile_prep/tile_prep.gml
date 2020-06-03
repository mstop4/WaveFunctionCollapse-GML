function load_tile_data() {
	if (ds_exists(raw_tile_data, ds_type_map)) {
		ds_map_destroy(raw_tile_data);
	}

	if (ds_exists(tile_data, ds_type_map)) {
		ds_map_destroy(tile_data);
	}

	raw_tile_data = load_tile_json(tile_data_json);
	tile_data = generate_tile_data(raw_tile_data);
}


/// @arg filename
function load_tile_json(_filename) {
	var _file = file_text_open_read(_filename);
	var _raw_json = "";

	while (!file_text_eof(_file)) {
		_raw_json += file_text_readln(_file);
	}

	file_text_close(_file);

	var _tile_data = json_decode(_raw_json);
	var _tiles = _tile_data[? "tiles"];
	var _len = ds_list_size(_tiles);

	if (!ds_map_exists(_tile_data, "weights")) {
		var _weights = ds_list_create();
	
		for (var i=0; i<_len; i++) {
			ds_list_add(_weights, 1);
		}
	
		ds_map_add_list(_tile_data, "weights", _weights);
	}

	for (var i=0; i<_len; i++) {
		var _tile = _tiles[| i];
		_tile[? "symmetry"] = variable_struct_get(symmetry_map, _tile[? "symmetry"]);
	}

	return _tile_data;
}


/// @arg raw_tile_data
function generate_tile_data(_raw_tile_data) {
	var _final_tile_data = ds_map_create();

	var _tiles = _raw_tile_data[? "tiles"];
	var _weights = _raw_tile_data[? "weights"];
	var _weights_len = ds_list_size(_weights);
	var _len = ds_list_size(_tiles);
	var _final_tiles = ds_list_create();
	ds_map_add_list(_final_tile_data, "tiles", _final_tiles);

	// Generate full tile data from raw tile and symmetry data
	for (var i=0; i<_len; i++) {
		var _tile_id = _tiles[| i][? "tileId"];

		var _symmetry = _tiles[| i][? "symmetry"];
		var _sides = _tiles[| i][? "sides"];
	
		var _symmetry_data = symmetry_data[_symmetry];
		var _exemplar_data = exemplar_tiles[_symmetry];
		var _exemplar_list = ds_list_create();
	
		// Generate exemplar tiles
		for (var j=0; j<8; j++) {
			if (_exemplar_data[j] > -1) {
				var _weight = 1;
				if (_tile_id < _weights_len) {
					_weight = _weights[| _tile_id];
				} else {
					show_debug_message("WARNING: Weight for tile id " + string(_tile_id) + " not defined.");
				}
			
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
}