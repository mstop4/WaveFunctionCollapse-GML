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

function wfc_async_start() {
	if (state == WFC_STATE.IDLE) {
		randomise();
		show_debug_message("Seed: " + string(random_get_seed()));
		start_time = current_time;
		wave_num = 0;
		async_mode = true;
	
		var _ok = wfc_reset();
	
		if (_ok) {
			state = WFC_STATE.BEGIN_STEP;
		}
	}
}

function wfc_async_process() {
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
}

