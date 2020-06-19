draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_colour(c_white);

if (instance_exists(cur_edited_tile)) {
	if (tile_mode == EDITOR_TILE_MODE.FINAL) {
		draw_tile(tileset_index, cur_edited_tile.tile_data, 0, 944, 128);
		draw_text(944, 32, "Tile Index: " + string(cur_edited_tile.tile_index));
		draw_text(944, 48, "Tile ID: " + string(cur_edited_tile.tile_id));
		draw_tile(tileset_index, cur_edited_tile.tile_data, 0, 944, 272);

		draw_text(944 + 16, 128 - 16, string(side_array[| SIDE.TOP]));
		draw_text(944 + 16, 128 + 48, string(side_array[| SIDE.BOTTOM]));
		draw_text(944 + 16, 272 - 16, cur_edited_tile.possible_neighbours[SIDE.TOP]);
		draw_text(944 + 16, 272 + 48, cur_edited_tile.possible_neighbours[SIDE.BOTTOM]);
		draw_set_halign(fa_right);
		draw_text(944 - 16, 128 + 16, string(side_array[| SIDE.LEFT]));
		draw_text(944 - 16, 272 + 16, cur_edited_tile.possible_neighbours[SIDE.LEFT]);
		draw_set_halign(fa_left);
		draw_text(944 + 48, 128 + 16, string(side_array[| SIDE.RIGHT]));
		draw_text(944 + 48, 272 + 16, cur_edited_tile.possible_neighbours[SIDE.RIGHT]);
		
		draw_text(640, 208, "Possible Neighbours:");
	}
	
	else if (tile_mode == EDITOR_TILE_MODE.RAW) {
		draw_tile(tileset_index, cur_edited_tile.tile_data, 0, 944, 128);
		draw_text(944, 32, "Tile Index: " + string(cur_edited_tile.tile_index));
		draw_text(944, 48, "Tile ID: " + string(cur_edited_tile.tile_id));
		draw_text(944, 64, "Symmetry: " + cur_edited_tile.symmetry_label);
		
		draw_text(944 + 16, 128 - 16, string(side_array[| SIDE.TOP]));
		draw_text(944 + 16, 128 + 48, string(side_array[| SIDE.BOTTOM]));
		draw_set_halign(fa_right);
		draw_text(944 - 16, 128 + 16, string(side_array[| SIDE.LEFT]));
		draw_set_halign(fa_left);
		draw_text(944 + 48, 128 + 16, string(side_array[| SIDE.RIGHT]));
	}
	
	else {
		draw_text(944, 32, "Tile Index: -");
		draw_text(944, 48, "Tile ID: -");
	}
}

else {
	draw_text(944, 32, "Tile Index: -");
	draw_text(944, 48, "Tile ID: -");
}