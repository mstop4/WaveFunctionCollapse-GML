/// @arg current_cell
/// @arg neighbour_cell
/// @arg side
/// @arg cell_x
/// @arg cell_y
function wfc_check_neighbour() {

	var _cur_cell = argument[0];
	var _nb_cell = argument[1];
	var _side = argument[2];
	var _cell_x = argument[3];
	var _cell_y = argument[4];

	var _num_cur_choices = ds_list_size(_cur_cell);
	var _num_nb_choices = ds_list_size(_nb_cell);
	var _tile_data = tile_data[? "tiles"];

	var _cell_changed = false;
	var _deleted_choices = ds_stack_create();

	// Go through all choices in current tile...
	for (var i=0; i<_num_cur_choices; i++) {
		var _cur_choice = _cur_cell[| i];
		var _cur_tile_data = _tile_data[| _cur_choice];
		var _cur_sides = _cur_tile_data[? "sides"];
		var _cur_side = _cur_sides[| _side];
		var _cur_side_group = _cur_side[? "sideGroup"];
		var _cur_choice_valid = false;
	
		// Compare against all valid neighbours in neighbour tile...
		for (var j=0; j<_num_nb_choices; j++) {
			var _nb_choice = _nb_cell[| j];
			var _nb_tile_data = _tile_data[| _nb_choice];
			var _nb_sides = _nb_tile_data[? "sides"];
			var _nb_side = _nb_sides[| opposite_neighbour[_side]];
			var _nb_neighbours = _nb_side[? "neighbours"];
		
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
		ds_queue_enqueue(done_queue_x, _cell_x);
		ds_queue_enqueue(done_queue_y, _cell_y);
	}

	ds_stack_destroy(_deleted_choices);

	return _cell_changed;


}
