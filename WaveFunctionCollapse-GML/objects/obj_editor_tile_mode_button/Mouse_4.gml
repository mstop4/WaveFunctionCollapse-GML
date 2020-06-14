with (editor_id) {
	tile_mode = tile_mode == EDITOR_TILE_MODE.MAX-1 ? EDITOR_TILE_MODE.RAW : tile_mode + 1;
	
	if (tile_mode == EDITOR_TILE_MODE.RAW) {
		toggle_layer(raw_ui_layer, true);
		toggle_layer(final_ui_layer, false);
	} else if (tile_mode == EDITOR_TILE_MODE.FINAL) {
		toggle_layer(raw_ui_layer, false);
		toggle_layer(final_ui_layer, true);
	}
}