// Choose a cell with the least entropy
var _cell = wfc_get_cell_least_entropy(wave_grid);

// Check if all cells has been fully collapsed
if (_cell[0] == -1) {
	return true;
}

// Collapse cell
wfc_collapse_cell(wave_grid[# _cell[0], _cell[1]]);
done_grid[# _cell[0], _cell[1]] = CELL_STATE.COLLAPSED;
ds_queue_enqueue(done_queue_x, _cell[0]);
ds_queue_enqueue(done_queue_y, _cell[1]);

wfc_push_neighbours(_cell[0], _cell[1]);

return false;