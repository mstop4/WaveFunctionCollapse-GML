/// @arg wave_grid
function wfc_get_cell_least_entropy(_wave_grid) {
	var _least_amount = 100000;
	var _least_coords_list = ds_list_create();

	for (var i=0; i<grid_width; i++) {
		for (var j=0; j<grid_height; j++) {
			if (done_grid[# i, j] == CELL_STATE.IDLE) {
				var _len = ds_list_size(_wave_grid[# i, j]);
				if (_len <= _least_amount) {
					if (_len < _least_amount) {
						_least_amount = _len;
						ds_list_clear(_least_coords_list);
					}
					ds_list_add(_least_coords_list, new Vector2(i, j));
				}
			}
		}
	}
	var _len = ds_list_size(_least_coords_list);

	if (_len == 0) return new Vector2(-1, -1);

	var _index = irandom_range(0, _len-1);
	var _choice = _least_coords_list[| _index];
	ds_list_destroy(_least_coords_list);
	return _choice;
}


/// @arg cell_list
function wfc_collapse_cell(_cell_list) {
	var _len = ds_list_size(_cell_list);
	var _total_weight = 0;
	var _weights = ds_queue_create();
	var _tiles = tile_data[? "tiles"];

	for (var i=0; i<_len; i++) {
		var _cur_tile = _tiles[| _cell_list[| i]];
		var _tile_id = _cur_tile[? "tileId"];
	
		if (ds_list_find_index(exclusion_list, _tile_id) == -1) {
			ds_queue_enqueue(_weights, _cur_tile[? "weight"]);
			_total_weight += _cur_tile[? "weight"];	
		}
	}

	var _roll = random_range(0, _total_weight);
	var _index = 0;

	while (_roll > ds_queue_head(_weights)) {
		_index++;
		_roll -= ds_queue_dequeue(_weights);
	}

	var _choice = _cell_list[| _index];

	ds_list_clear(_cell_list);
	ds_list_add(_cell_list, _choice);

	ds_queue_destroy(_weights);
}


/// @arg current_cell
/// @arg neighbour_cell
/// @arg side
/// @arg cell
function wfc_check_neighbour(_cur_cell, _nb_cell, _side, _cell) {
	var _num_cur_choices = ds_list_size(_cur_cell);
	var _num_nb_choices = ds_list_size(_nb_cell);
	var _tile_data = tile_data[? "tiles"];

	var _cell_changed = false;
	var _deleted_choices = ds_stack_create();

	// Go through all choices in current tile...
	for (var i=0; i<_num_cur_choices; i++) {
		var _cur_choice = _cur_cell[| i];
		var _cur_side_group = _tile_data[| _cur_choice][? "sides"][| _side][? "sideGroup"];
		var _cur_choice_valid = false;
	
		// Compare against all valid neighbours in neighbour tile...
		for (var j=0; j<_num_nb_choices; j++) {
			var _nb_choice = _nb_cell[| j];
			var _opposite_neighbour = opposite_neighbour[_side];
			var _nb_neighbours = _tile_data[| _nb_choice][? "sides"][| _opposite_neighbour][? "neighbours"];
		
			// Check side group of the current tile to see if it's
			// in the neighbours list of the neighbouring tile
			// Stop upon the first match
			if (ds_list_find_index(_nb_neighbours, _cur_side_group) != -1) {
				_cur_choice_valid = true;
				break;
			}
		}
	
		// If the current tile choice of the current tile has not been validated, remove it
		if (!_cur_choice_valid) {
			ds_stack_push(_deleted_choices, i);
		}
	}

	var _cell_changed = ds_stack_size(_deleted_choices) > 0;

	while (!ds_stack_empty(_deleted_choices)) {
		var _index = ds_stack_pop(_deleted_choices);
		ds_list_delete(_cur_cell, _index);
	}

	if (ds_list_size(_cur_cell) == 1) {
		ds_queue_enqueue(done_queue, _cell);
	}

	ds_stack_destroy(_deleted_choices);

	return _cell_changed;
}


/// @arg _cell
function wfc_push_neighbours(_cell) {
	// Push neighbours to stack

	// top, bottom
	for (var i=-1; i<2; i+=2) {
		var _new = new Vector2(_cell.x, _cell.y + i);
		
		// Ignore out of bounds neighbours
		if (_new.x < 0 || _new.x >= grid_width || _new.y < 0 || _new.y >= grid_height)
			continue;
			
		// Ignore neighbours that aren't idle
		if (checked_grid[# _new.x, _new.y] != CELL_STATE.IDLE) 
			continue;

		ds_stack_push(tile_stack, _new);
		checked_grid[# _new.x, _new.y] = CELL_STATE.IN_STACK;
	}

	// left, right
	for (var i=-1; i<2; i+=2) {
		var _new = new Vector2(_cell.x + i, _cell.y);
		
		// Ignore out of bounds neighbours
		if (_new.x < 0 || _new.x >= grid_width || _new.y < 0 || _new.y >= grid_height)
			continue;
			
		// Ignore neighbours that aren't idle
		if (checked_grid[# _new.x, _new.y] != CELL_STATE.IDLE)
			continue;

		ds_stack_push(tile_stack, _new);
		checked_grid[# _new.x, _new.y] = CELL_STATE.IN_STACK;
	}
}


/// @arg source_grid
/// @arg dest_grid
function copy_grid() {
	// Makes deep copy of grid of lists

	var _source_grid = argument[0];
	var _dest_grid = argument[1];

	var _w = min(ds_grid_width(_source_grid), ds_grid_width(_dest_grid));
	var _h = min(ds_grid_height(_source_grid), ds_grid_height(_dest_grid));

	for (var i=0; i<_w; i++) {
		for (var j=0; j<_h; j++) {
			ds_list_copy(_dest_grid[# i, j], _source_grid[# i, j]);
		}
	}
}
