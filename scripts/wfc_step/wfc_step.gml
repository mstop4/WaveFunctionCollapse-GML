// Collapse cell with the least entropy
var _cell = get_cell_least_entropy(wave_grid);
collapse_cell(wave_grid[# _cell[0], _cell[1]]);
copy_grid(wave_grid, wave_grid_copy);


// Assign tiles to cells that have fully collapsed
var _tile_data = tile_data[? "tiles"];

for (var i=0; i<width_tiles; i++) {
	for (var j=0; j<height_tiles; j++) {
		if (!done_grid[# i, j]) {
			var _len = ds_list_size(wave_grid[# i, j]);
		
			if (_len <= 1) {
				if (_len == 1) {
					var _finished_cell = wave_grid[# i, j];
					var _index = _finished_cell[| 0]
					var _cur_tile = _tile_data[| _index];
					var _tile_id = _cur_tile[? "tileId"];
					var _transforms = _cur_tile[? "transforms"];
					
					var _data = tilemap_get(wfc_tilemap, i, j);
					_data = tile_set_index(_data, _tile_id);
					_data = tile_set_rotate(_data, _transforms & 1);
					_data = tile_set_flip(_data, _transforms & 2);
					_data = tile_set_mirror(_data, _transforms & 4);
					tilemap_set(wfc_tilemap, _data, i, j);
				}
				done_grid[# i, j] = true;
			}
		}
	}
}