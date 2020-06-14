with (editor_id) {
	tile_mode = tile_mode == 2 ? 1 : tile_mode + 1;
	
	if (tile_mode == 1) {
		layer_set_visible()
	}
}