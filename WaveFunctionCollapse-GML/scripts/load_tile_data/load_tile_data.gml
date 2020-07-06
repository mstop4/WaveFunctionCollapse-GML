show_debug_message("Loading tile data: " + tile_data_json);

if (ds_exists(raw_tile_data, ds_type_map)) {
	ds_map_destroy(raw_tile_data);
}

if (ds_exists(tile_data, ds_type_map)) {
	ds_map_destroy(tile_data);
}

raw_tile_data = load_tile_json(tile_data_json);
tile_data = generate_tile_data(raw_tile_data);