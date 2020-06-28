/// @arg seed
var _seed = argument[0];

if (state == WFC_STATE.IDLE) {
	random_set_seed(_seed);
	start_time = current_time;
	async_mode = false;
	wave_num = 0;
	ok = true;
	
	var _ok = wfc_reset();
	
	if (!_ok) {
		exit;
	}

	while (true) {
		wave_num++;
		//show_debug_message("Wave " + string(wave_num));
		state = WFC_STATE.BEGIN_STEP;
		propagation_done = false; 

		var _wfc_done = wfc_begin_step();
		if (_wfc_done) {
			state = WFC_STATE.IDLE;
			break;
		}

		do {
			state = WFC_STATE.PROPAGATION;
			grid_changed = false;
			// Done cells don't need to be checked
			ds_grid_copy(checked_grid, done_grid);

			while (!propagation_done) {
				propagation_done = wfc_propagate_step();
			}
			
			state = WFC_STATE.END_STEP;
			ok = wfc_end_step();
		} until (!grid_changed || !ok)
		
		if (!ok) {
			state = WFC_STATE.IDLE;

			if (track_errors) {
				errored = true;
				var _num_tile_ids = ds_list_size(last_collapse_tile_id);
				last_collapse_tile_data = tile_set_index(last_collapse_tile_data, last_collapse_tile_id[| irandom(_num_tile_ids-1)]);
			}

			show_message_async("Something went wrong");
			show_message_async("Time taken: " + string((current_time - start_time) / 1000) + " s");
			exit;
		}
	}
	
	state = WFC_STATE.IDLE;
	show_message_async("Time taken: " + string((current_time - start_time) / 1000) + " s");
}