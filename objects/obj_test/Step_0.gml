if (state != WFC_STATE.IDLE && async_mode) {
	step_time = 0;
	
	while (step_time < alotted_time) {
		switch (state) {
			case WFC_STATE.BEGIN_STEP:
				wave_num++;
				show_debug_message("Wave " + string(wave_num));
				propagation_done = false;

				var _wfc_done = wfc_begin_step();
				if (_wfc_done) {
					state = WFC_STATE.IDLE;
					show_message_async("Time taken: " + string((current_time - start_time) / 1000) + " s");
					break;
				}
				state = WFC_STATE.PROPAGATION;
			break;
		
			case WFC_STATE.PROPAGATION:
				grid_changed = false;
				propagation_done = wfc_propagate_step();
				
				if (propagation_done)
					state = WFC_STATE.END_STEP;
			break;
			
			case WFC_STATE.END_STEP:
				wfc_end_step();
				
				if (!grid_changed) {
					state = WFC_STATE.BEGIN_STEP;
				} else {
					state = WFC_STATE.PROPAGATION;
				}
			break;
		}
		
		step_time += delta_time;
	}
}