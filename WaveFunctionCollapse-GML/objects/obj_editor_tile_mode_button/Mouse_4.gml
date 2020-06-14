with (editor_id) {
	tile_mode = tile_mode == EDITOR_TILE_MODE.MAX-1 ? EDITOR_TILE_MODE.RAW : tile_mode + 1;
	
	if (tile_mode == EDITOR_TILE_MODE.RAW) {
		layer_set_visible(raw_ui_layer, true);
		layer_set_visible(final_ui_layer, false);
	} else if (tile_mode == EDITOR_TILE_MODE.FINAL) {
		layer_set_visible(raw_ui_layer, false);
		layer_set_visible(final_ui_layer, true);
	}
}