/// @arg current_cell
/// @arg neighbour_cell
/// @arg side
/// @arg cell_x
/// @arg cell_y

var _cur_cell = argument[0];
var _nb_cell = argument[1];
var _side = argument[2];
var _cell_x = argument[3];
var _cell_y = argument[4];

var _num_cur_choices = ds_list_size(_cur_cell);
var _num_nb_choices = ds_list_size(_nb_cell);
var _tile_data = tile_data[? "tiles"];

// Go through all choices in current tile...
for (var i=0; i<_num_cur_choices; i++) {
	var _cur_choice = _cur_cell[| i];
	var _cur_tile_data = _tile_data[| _cur_choice];
	var _cur_sides = _cur_tile_data[? "sides"];
	var _cur_side = _cur_sides[| _side];
	var _cur_side_groups = _cur_side[? "sideGroups"];
	var _cur_side_groups_len = ds_list_size(_cur_side_groups);
	var _cur_choice_valid = false;
	
	// Compare against all valid neighbours in neighbour tile...
	for (var j=0; j<_num_nb_choices; j++) {
		var _nb_choice = _nb_cell[| j];
		var _nb_tile_data = _tile_data[| _nb_choice];
		var _nb_sides = _nb_tile_data[? "sides"];
		var _nb_side = _nb_sides[| opposite_neighbour[_side]];
		var _nb_neighbours = _nb_side[? "neighbours"];
		
		// Check each side group of the current tile to see if it's
		// in the neighbours list of the neighbouring tile
		// Stop upon the first match
		for (var k=0; k<_cur_side_groups_len; k++) {
			if (ds_list_find_index(_nb_neighbours, _cur_side_groups[| k]) != -1) {
				_cur_choice_valid = true;
				break;
			}
		}
		
		if (_cur_choice_valid) break;
	}
	
	// If the current tile choice of the current tile has not been validated, remove it
	if (!_cur_choice_valid) {
		grid_changed = true;
		ds_list_delete(_cur_cell, i);
		_num_cur_choices = ds_list_size(_cur_cell);

		// If there is only one chocie left, put cell into done queue
		if (_num_cur_choices == 1) {
			ds_queue_enqueue(done_queue_x, _cell_x);
			ds_queue_enqueue(done_queue_y, _cell_y);
		}
		
		i--;
	}
}