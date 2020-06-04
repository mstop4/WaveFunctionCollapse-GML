if (state == WFC_STATE.IDLE) {
	//random_set_seed(628826461);
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