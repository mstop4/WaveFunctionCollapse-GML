// Collapse cell with the least entropy
var _cell = get_cell_least_entropy(wave_grid);

// Check if done
if (_cell[0] == -1) return true;

collapse_cell(wave_grid[# _cell[0], _cell[1]]);
copy_grid(wave_grid, wave_grid_copy);
return false;