if (state != WFC_STATE.IDLE && async_mode) {
	if (alotted_time > 0) {
		step_time = 0;
	
		while (step_time < alotted_time) {
			wfc_async_process();
			step_time += delta_time;
		}
	} else {
		var _done_step = false;
		while (!_done_step) {
			_done_step = wfc_async_process();
		}
	}
}