tilemap_clear(wfc_tilemap, 0);
ds_grid_clear(done_grid, CELL_STATE.IDLE);
ds_grid_clear(checked_grid, CELL_STATE.IDLE);

ds_queue_clear(done_queue_x);
ds_queue_clear(done_queue_y);
ds_stack_clear(tile_stack_x);
ds_stack_clear(tile_stack_y);
var _tiles = tile_data[? "tiles"];
var _num_tiles = ds_list_size(_tiles);

// Create base choice list for all cells
// Abort the WFC process if all available tiles are excluded
var _base_choices = ds_list_create();
for (var i=0; i<_num_tiles; i++) {
	var _cur_tile = _tiles[| i];
	var _tile_id = _cur_tile[? "tileId"];
	
	if (ds_list_find_index(exclusion_list, _tile_id) == -1)			
		ds_list_add(_base_choices, i);
}

if (ds_list_size(_base_choices) == 0) {
	show_message_async("No tiles available to use!");
	return false;
}

for (var i=0; i<grid_width; i++) {
	for (var j=0; j<grid_height; j++) {
		ds_list_copy(wave_grid[# i, j], _base_choices);
	}
}

return true;