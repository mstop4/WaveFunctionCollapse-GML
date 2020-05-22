/// @arg _cell_x
/// @arg _cell_y
// Push neighbours to stack

var _cell_x = argument[0];
var _cell_y = argument[1];

for (var i=-1; i<2; i+=2) {
	for (var j=-1; j<2; j+=2) {
		var _new_x = _cell_x + i;
		var _new_y = _cell_y + j;
		
		// Ignore out of bounds neighbours
		if (_new_x < 0 || _new_x >= width_tiles || _new_y < 0 || _new_y >= height_tiles)
			continue;
			
		// Ignore neighbours that have already been checked or pushed to the stack
		if (checked_grid[# _new_x, _new_y] != CELL_STATE.UNCHECKED) 
			continue;

		ds_stack_push(tile_stack_x, _new_x);
		ds_stack_push(tile_stack_y, _new_y);
		checked_grid[# _new_x, _new_y] = CELL_STATE.IN_STACK;
	}
}