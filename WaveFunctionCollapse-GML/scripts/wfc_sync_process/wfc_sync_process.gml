function wfc_sync_process() {
	if (state == WFC_STATE.IDLE) {
		randomise();
		show_debug_message("Seed: " + string(random_get_seed()));
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
				show_message_async("Something went wrong");
				show_message_async("Time taken: " + string((current_time - start_time) / 1000) + " s");
				exit;
			}
		}
	
		state = WFC_STATE.IDLE;
		show_message_async("Time taken: " + string((current_time - start_time) / 1000) + " s");
	}


}
