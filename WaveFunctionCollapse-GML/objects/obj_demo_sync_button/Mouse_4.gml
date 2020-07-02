with (demo_id) {
	if (state ==  WFC_STATE.IDLE) {
		randomise();
		seed = random_get_seed();
		get_seed_sync = get_integer_async("Sync Mode\n\nSeed:", seed);
	}
}