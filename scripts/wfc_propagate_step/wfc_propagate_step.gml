if (ds_stack_empty(tile_stack_x) || ds_stack_empty(tile_stack_y))
	return true;

var _cur_x = ds_stack_pop(tile_stack_x);
var _cur_y = ds_stack_pop(tile_stack_y);
var _cur_cell = wave_grid[# _cur_x, _cur_y];

var _cell_changed = false;

// For each side of the cell...
for (var i=0; i<SIDE.MAX; i++) {
	var _nb_offsets = neighbour_offsets[i];
	var _nb_x = _cur_x + _nb_offsets[0];
	var _nb_y = _cur_y + _nb_offsets[1];
		
	// Ignore out of bounds neighbours
	if (_nb_x < 0 || _nb_x >= grid_width || _nb_y < 0 || _nb_y >= grid_height)
		continue;
			
	var _nb_cell = wave_grid[# _nb_x, _nb_y];
	_cell_changed = wfc_check_neighbour(_cur_cell, _nb_cell, i, _cur_x, _cur_y);
}

// Revert back to idle
checked_grid[# _cur_x, _cur_y] = CELL_STATE.IDLE;

// Check neighbours if cell's choices have changed
if (_cell_changed)
	wfc_push_neighbours(_cur_x, _cur_y);

return false;