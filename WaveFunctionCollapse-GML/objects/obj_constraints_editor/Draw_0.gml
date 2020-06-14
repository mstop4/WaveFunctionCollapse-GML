if (instance_exists(cur_edited_tile)) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);

	if (tile_mode == EDITOR_TILE_MODE.FINAL) {
		draw_tile(cur_edited_tile.tileset_index, cur_edited_tile.tile_data, 0, 944, 128);
		draw_text(944, 32, "Tile Index: " + string(cur_edited_tile.tile_index));
		draw_text(944, 48, "Tile ID: " + string(cur_edited_tile.tile_id));
		draw_text(944, 64, "Sides: " + side_label[side_mode]);

		draw_text(944 + 16, 128 - 16, string(side_array[SIDE.TOP]));
		draw_text(944 + 16, 128 + 48, string(side_array[SIDE.BOTTOM]));
		draw_set_halign(fa_right);
		draw_text(944 - 16, 128 + 16, string(side_array[SIDE.LEFT]));
		draw_set_halign(fa_left);
		draw_text(944 + 48, 128 + 16, string(side_array[SIDE.RIGHT]));
	} else if (tile_mode == EDITOR_TILE_MODE.RAW) {
		draw_tile(cur_edited_tile.tileset_index, cur_edited_tile.tile_data, 0, 944, 128);
		draw_text(944, 32, "Tile Index: " + string(cur_edited_tile.tile_index));
		draw_text(944, 48, "Tile ID: " + string(cur_edited_tile.tile_id));
		draw_text(944, 64, "Sides: " + side_label[side_mode]);
	} else {
		draw_text(944, 32, "Tile Index: -");
		draw_text(944, 48, "Tile ID: -");
		draw_text(944, 64, "Sides: " + side_label[EDITOR_SIDE_MODE.NONE]);
	}
} else {
	draw_text(944, 32, "Tile Index: -");
	draw_text(944, 48, "Tile ID: -");
	draw_text(944, 64, "Sides: " + side_label[EDITOR_SIDE_MODE.NONE]);
}