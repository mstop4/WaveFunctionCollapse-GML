// Choose a cell with the least entropy
var _cell = wfc_get_cell_least_entropy(wave_grid);

// Check if all cells has been fully collapsed
if (_cell[0] == -1) {
	state = WFC_STATE.IDLE;
	return true;
}

// Collapse cell
wfc_collapse_cell(wave_grid[# _cell[0], _cell[1]]);
done_grid[# _cell[0], _cell[1]] = CELL_STATE.CHECKED;

// Done cells don't need to be checked
ds_grid_copy(checked_grid, done_grid);

wfc_push_neighbours(_cell[0], _cell[1]);
state = WFC_STATE.PROPAGATION;

return false;