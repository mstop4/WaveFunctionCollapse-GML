tilemap_clear(wfc_tilemap, 0);
ds_grid_clear(done_grid, CELL_STATE.IDLE);
ds_grid_clear(checked_grid, CELL_STATE.IDLE);

ds_queue_clear(done_queue_x);
ds_queue_clear(done_queue_y);
ds_stack_clear(tile_stack_x);
ds_stack_clear(tile_stack_y);
var _tiles = tile_data[? "tiles"];
var _num_tiles = ds_list_size(_tiles);

for (var i=0; i<grid_width; i++) {
	for (var j=0; j<grid_height; j++) {
		ds_list_clear(wave_grid[# i, j]);

		for (var k=0; k<_num_tiles; k++) {
			var _cur_tile = _tiles[| k];
			var _tile_id = _cur_tile[? "tileId"];
			
			if (ds_list_find_index(exclusion_list, _tile_id) == -1)			
				ds_list_add(wave_grid[# i, j], k);
		}
	}
}