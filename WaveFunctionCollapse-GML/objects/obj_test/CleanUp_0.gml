ds_list_destroy(exclusion_list);

for (var i=0; i<grid_width; i++) {
	for (var j=0; j<grid_height; j++) {
		ds_list_destroy(wave_grid[# i, j]);
	}
}

ds_grid_destroy(wave_grid);
ds_grid_destroy(done_grid);
ds_queue_destroy(done_queue_x);
ds_queue_destroy(done_queue_y);
ds_grid_destroy(checked_grid);

ds_map_destroy(raw_tile_data);
ds_map_destroy(tile_data);

ds_stack_destroy(tile_stack_x);
ds_stack_destroy(tile_stack_y);

layer_destroy(wfc_layer);

destroy_data();