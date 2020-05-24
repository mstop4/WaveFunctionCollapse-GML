/// @arg _cell_x
/// @arg _cell_y
// Push neighbours to stack

var _cell_x = argument[0];
var _cell_y = argument[1];

// top, bottom
for (var i=-1; i<2; i+=2) {
	var _new_x = _cell_x;
	var _new_y = _cell_y + i;
		
	// Ignore out of bounds neighbours
	if (_new_x < 0 || _new_x >= width_tiles || _new_y < 0 || _new_y >= height_tiles)
		continue;
			
	// Ignore neighbours that aren't idle
	if (checked_grid[# _new_x, _new_y] != CELL_STATE.IDLE) 
		continue;

	ds_stack_push(tile_stack_x, _new_x);
	ds_stack_push(tile_stack_y, _new_y);
	checked_grid[# _new_x, _new_y] = CELL_STATE.IN_STACK;
}

// left, right
for (var i=-1; i<2; i+=2) {
	var _new_x = _cell_x + i;
	var _new_y = _cell_y;
		
	// Ignore out of bounds neighbours
	if (_new_x < 0 || _new_x >= width_tiles || _new_y < 0 || _new_y >= height_tiles)
		continue;
			
	// Ignore neighbours that aren't idle
	if (checked_grid[# _new_x, _new_y] != CELL_STATE.IDLE)
		continue;

	ds_stack_push(tile_stack_x, _new_x);
	ds_stack_push(tile_stack_y, _new_y);
	checked_grid[# _new_x, _new_y] = CELL_STATE.IN_STACK;
}