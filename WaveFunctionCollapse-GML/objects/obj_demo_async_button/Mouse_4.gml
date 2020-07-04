with (demo_id) {
	if (state ==  WFC_STATE.IDLE) {
		randomise();
		seed = random_get_seed();
		get_seed_async = get_integer_async("Async Mode\n\nEnter Seed:", seed);
	}
}