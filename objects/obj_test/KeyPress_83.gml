if (state == WFC_STATE.IDLE) {
	start_time = current_time;
	async_mode = false;
	wave_num = 0;
	
	wfc_reset();

	while (true) {
		wave_num++;
		show_debug_message("Wave " + string(wave_num));
		state = WFC_STATE.BEGIN_STEP;
		propagation_done = false; 

		var _wfc_done = wfc_begin_step();
		if (_wfc_done) {
			state = WFC_STATE.IDLE;
			break;
		}
		
		state = WFC_STATE.PROPAGATION;

		do {
			grid_changed = false;
			while (!propagation_done) {
				propagation_done = wfc_propagate_step();
			}
			state = WFC_STATE.END_STEP;
			wfc_end_step();
		} until (!grid_changed)
		
		state = WFC_STATE.IDLE;
	}
}

show_message_async("Time taken: " + string((current_time - start_time) / 1000) + " s");