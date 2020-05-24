if (ds_stack_empty(tile_stack_x) || ds_stack_empty(tile_stack_y))
	return true;

var _cur_x = ds_stack_pop(tile_stack_x);
var _cur_y = ds_stack_pop(tile_stack_y);
var _cur_cell = wave_grid[# _cur_x, _cur_y];

// For each side of the cell...
for (var i=0; i<SIDE.MAX; i++) {
	var _nb_offsets = neighbour_offsets[i];
	var _nb_x = _cur_x + _nb_offsets[0];
	var _nb_y = _cur_y + _nb_offsets[1];
		
	// Ignore out of bounds neighbours
	if (_nb_x < 0 || _nb_x >= width_tiles || _nb_y < 0 || _nb_y >= height_tiles)
		continue;
			
	var _nb_cell = wave_grid[# _nb_x, _nb_y];
	wfc_check_neighbour(_cur_cell, _nb_cell, i, _cur_x, _cur_y);
}

// Mark as checked for this wave
checked_grid[# _cur_x, _cur_y] = CELL_STATE.CHECKED;
wfc_push_neighbours(_cur_x, _cur_y);

return false;