if (errored) {
	draw_tile(tileset_index, last_collapse_tile_data, 0, last_collapse_x * tile_width, last_collapse_y * tile_height);
	draw_set_colour(c_red);
	draw_set_alpha(0.5);
	draw_rectangle(last_collapse_x * tile_width, last_collapse_y * tile_height, (last_collapse_x+1) * tile_width - 1, (last_collapse_y+1) * tile_height - 1, false);
	draw_set_alpha(1);
}