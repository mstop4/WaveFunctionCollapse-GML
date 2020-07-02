var _id = ds_map_find_value(async_load, "id");

if (_id == get_seed_async) {
	if (ds_map_find_value(async_load, "status")) {
		seed = ds_map_find_value(async_load, "value");
		show_debug_message("Seed: " + string(seed));
		wfc_async_start(seed);
	}
} else if (_id == get_seed_sync) {
	if (ds_map_find_value(async_load, "status")) {
		seed = ds_map_find_value(async_load, "value");
		show_debug_message("Seed: " + string(seed));
		wfc_sync_process(seed);
	}
}
