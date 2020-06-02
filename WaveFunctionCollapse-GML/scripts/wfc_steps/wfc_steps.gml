function wfc_begin_step() {
	// Choose a cell with the least entropy
	var _cell = wfc_get_cell_least_entropy(wave_grid);

	// Check if all cells has been fully collapsed
	if (_cell.x == -1) {
		return true;
	}

	// Collapse cell
	wfc_collapse_cell(wave_grid[# _cell.x, _cell.y]);
	done_grid[# _cell.x, _cell.y] = CELL_STATE.COLLAPSED;
	ds_queue_enqueue(done_queue, _cell);

	wfc_push_neighbours(_cell);

	return false;
}


function wfc_end_step() {
	// Assign tiles to cells that have fully collapsed
	var _tile_data = tile_data[? "tiles"];

	while (!ds_queue_empty(done_queue)) {
		var _cell = ds_queue_dequeue(done_queue);
	
		if (done_grid[# _cell.x, _cell.y] != CELL_STATE.TILED) {
			var _len = ds_list_size(wave_grid[# _cell.x, _cell.y]);
		
			if (_len == 1) {
				var _index = wave_grid[# _cell.x, _cell.y][| 0];
				var _cur_tile = _tile_data[| _index];
				var _tile_id = _cur_tile[? "tileId"];
				var _transforms = _cur_tile[? "transforms"];
					
				var _data = tilemap_get(wfc_tilemap, _cell.x, _cell.y);
				_data = tile_set_index(_data, _tile_id);
				_data = tile_set_rotate(_data, _transforms & 1);
				_data = tile_set_flip(_data, _transforms & 2);
				_data = tile_set_mirror(_data, _transforms & 4);
				tilemap_set(wfc_tilemap, _data, _cell.x, _cell.y);
			} else if (_len == 0) {
				show_debug_message("OOPS: No valid tile choices at " + string(_cell.x) + ", " + string(_cell.y));
				var _data = tilemap_get(wfc_tilemap, _cell.x, _cell.y);
				_data = tile_set_index(_data, error_tile_index);
				tilemap_set(wfc_tilemap, _data, _cell.x, _cell.y);
				return false;
			}
			done_grid[# _cell.x, _cell.y] = CELL_STATE.TILED;
		}
	}

	return true;
}


function wfc_propagate_step() {
	if (ds_stack_empty(tile_stack))
		return true;

	var _cur = ds_stack_pop(tile_stack);
	var _cur_cell = wave_grid[# _cur.x, _cur.y];

	var _cell_changed = false;

	// For each side of the cell...
	for (var i=0; i<SIDE.MAX; i++) {
		var _nb_offsets = neighbour_offsets[i];
		var _nb = new Vector2(_cur.x + _nb_offsets[0], _cur.y + _nb_offsets[1]);
		
		// Ignore out of bounds neighbours
		if (_nb.x < 0 || _nb.x >= grid_width || _nb.y < 0 || _nb.y >= grid_height)
			continue;
			
		var _nb_cell = wave_grid[# _nb.x, _nb.y];
		_cell_changed = wfc_check_neighbour(_cur_cell, _nb_cell, i, _cur) || _cell_changed;
		grid_changed = grid_changed || _cell_changed;
	}

	// Revert back to idle
	checked_grid[# _cur.x, _cur.y] = CELL_STATE.IDLE;

	// Check neighbours if cell's choices have changed
	if (_cell_changed)
		wfc_push_neighbours(_cur);

	return false;
}


function wfc_reset() {
	tilemap_clear(wfc_tilemap, 0);
	ds_grid_clear(done_grid, CELL_STATE.IDLE);
	ds_grid_clear(checked_grid, CELL_STATE.IDLE);

	ds_queue_clear(done_queue);
	ds_stack_clear(tile_stack);
	var _tiles = tile_data[? "tiles"];
	var _num_tiles = ds_list_size(_tiles);

	// Create base choice list for all cells
	// Abort the WFC process if all available tiles are excluded
	var _base_choices = ds_list_create();
	for (var i=0; i<_num_tiles; i++) {
		var _cur_tile = _tiles[| i];
		var _tile_id = _cur_tile[? "tileId"];
	
		if (ds_list_find_index(exclusion_list, _tile_id) == -1)			
			ds_list_add(_base_choices, i);
	}

	if (ds_list_size(_base_choices) == 0) {
		show_message_async("No tiles available to use!");
		return false;
	}

	for (var i=0; i<grid_width; i++) {
		for (var j=0; j<grid_height; j++) {
			ds_list_copy(wave_grid[# i, j], _base_choices);
		}
	}
	
	ds_list_destroy(_base_choices);

	return true;
}