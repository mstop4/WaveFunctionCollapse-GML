ds_map_destroy(symmetry_map);
ds_list_destroy(exclusion_list);

for (var i=0; i<width_tiles; i++) {
	for (var j=0; j<height_tiles; j++) {
		ds_list_destroy(wave_grid[# i, j]);
	}
}

ds_grid_destroy(wave_grid);
ds_grid_destroy(done_grid);
ds_grid_destroy(checked_grid);

ds_map_destroy(raw_tile_data);
ds_map_destroy(tile_data);

ds_stack_destroy(tile_stack_x);
ds_stack_destroy(tile_stack_y);

layer_destroy(wfc_layer);