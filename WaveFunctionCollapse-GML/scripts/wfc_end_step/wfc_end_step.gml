function wfc_end_step() {
	// Assign tiles to cells that have fully collapsed
	var _tile_data = tile_data[? "tiles"];

	while (!ds_queue_empty(done_queue_x) && !ds_queue_empty(done_queue_y)) {
		var _x = ds_queue_dequeue(done_queue_x);
		var _y = ds_queue_dequeue(done_queue_y);
	
		if (done_grid[# _x, _y] != CELL_STATE.TILED) {
			var _len = ds_list_size(wave_grid[# _x, _y]);
		
			if (_len == 1) {
				var _finished_cell = wave_grid[# _x, _y];
				var _index = _finished_cell[| 0]
				var _cur_tile = _tile_data[| _index];
				var _tile_id = _cur_tile[? "tileId"];
				var _transforms = _cur_tile[? "transforms"];
					
				var _data = tilemap_get(wfc_tilemap, _x, _y);
				_data = tile_set_index(_data, _tile_id);
				_data = tile_set_rotate(_data, _transforms & 1);
				_data = tile_set_flip(_data, _transforms & 2);
				_data = tile_set_mirror(_data, _transforms & 4);
				tilemap_set(wfc_tilemap, _data, _x, _y);
			} else if (_len == 0) {
				show_debug_message("OOPS: No valid tile choices at " + string(_x) + ", " + string(_y));
				var _data = tilemap_get(wfc_tilemap, _x, _y);
				_data = tile_set_index(_data, error_tile_index);
				tilemap_set(wfc_tilemap, _data, _x, _y);
				return false;
			}
			done_grid[# _x, _y] = CELL_STATE.TILED;
		}
	}

	return true;


}
