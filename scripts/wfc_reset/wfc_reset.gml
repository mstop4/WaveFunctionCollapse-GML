tilemap_clear(wfc_tilemap, 0);
ds_grid_clear(done_grid, CELL_STATE.UNCHECKED);

ds_stack_clear(tile_stack_x);
ds_stack_clear(tile_stack_y);
var _num_tiles = ds_list_size(tile_data[? "tiles"]);

for (var i=0; i<width_tiles; i++) {
	for (var j=0; j<height_tiles; j++) {
		ds_list_clear(wave_grid[# i, j]);
		for (var k=0; k<_num_tiles; k++) {
			ds_list_add(wave_grid[# i, j], k);
		}
	}
}