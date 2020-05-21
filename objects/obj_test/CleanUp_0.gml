for (var i=0; i<width_tiles; i++) {
	for (var j=0; j<height_tiles; j++) {
		ds_list_destroy(wave_grid[# i, j]);
		ds_list_destroy(wave_grid_copy[# i, j]);
	}
}

ds_grid_destroy(wave_grid);
ds_grid_destroy(wave_grid_copy);
ds_grid_destroy(done_grid);

//ds_map_destroy(dummy_tile);
ds_map_destroy(raw_tile_data);
ds_map_destroy(tile_data);

ds_stack_destroy(tile_stack_x);
ds_stack_destroy(tile_stack_y);