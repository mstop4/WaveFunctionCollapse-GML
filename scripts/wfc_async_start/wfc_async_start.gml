if (state == WFC_STATE.IDLE) {
	start_time = current_time;
	wave_num = 0;
	async_mode = true;
	state = WFC_STATE.BEGIN_STEP;
	
	wfc_reset();
}