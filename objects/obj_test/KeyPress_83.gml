if (state == WFC_STATE.IDLE) {
	var _start_time = current_time;
	var _wave_num = 0;
	
	wfc_reset();

	while (true) {
		_wave_num++;
		show_debug_message("Wave " + string(_wave_num));
		var _propagation_done = false; 

		var _wfc_done = wfc_begin_step();
		if (_wfc_done) {
			break;
		}

		do {
			grid_changed = false;
			while (!_propagation_done) {
				_propagation_done = wfc_propagate_step();
			}
	
			wfc_end_step();
		} until (!grid_changed)
	}
}

show_message_async("Time taken: " + string((current_time - _start_time) / 1000) + " s");