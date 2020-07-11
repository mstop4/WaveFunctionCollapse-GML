/// @arg seed
var _seed = argument[0];

if (state == WFC_STATE.IDLE) {
	random_set_seed(_seed);
	start_time = current_time;
	wave_num = 0;
	async_mode = true;
	
	var _ok = wfc_reset();
	
	if (_ok) {
		state = WFC_STATE.BEGIN_STEP;
	}
}