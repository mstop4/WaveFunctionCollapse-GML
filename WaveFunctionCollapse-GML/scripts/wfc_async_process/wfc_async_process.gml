switch (state) {
	case WFC_STATE.BEGIN_STEP:
		wave_num++;
		propagation_done = false;

		var _wfc_done = wfc_begin_step();
		if (_wfc_done) {
			state = WFC_STATE.IDLE;
			show_message_async("Time taken: " + string((current_time - start_time) / 1000) + " s");
			return true;
			break;
		}
		state = WFC_STATE.PROPAGATION;
		grid_changed = false;
	break;
		
	case WFC_STATE.PROPAGATION:
		propagation_done = wfc_propagate_step();
				
		if (propagation_done)
			state = WFC_STATE.END_STEP;
	break;
			
	case WFC_STATE.END_STEP:
		var _ok = wfc_end_step();
				
		if (!_ok) {
			state = WFC_STATE.IDLE;

			if (track_errors) {
				errored = true;
				var _num_tile_ids = ds_list_size(last_collapse_tile_id);
				last_collapse_tile_data = tile_set_index(last_collapse_tile_data, last_collapse_tile_id[| irandom(_num_tile_ids-1)]);
			}

			show_message_async("Something went wrong");
			return true;
		} else if (!grid_changed) {
			state = WFC_STATE.BEGIN_STEP;
			return true;
		} else {
			state = WFC_STATE.PROPAGATION;
			grid_changed = false;

			// Done cells don't need to be checked
			ds_grid_copy(checked_grid, done_grid);
		}
	break;
}

return false;