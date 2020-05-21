init_enums();
width_tiles = room_width div 32;
height_tiles = room_height div 32;

init_symmetries();

raw_tile_data = load_tile_json("test.json");
tile_data = generate_tile_data(raw_tile_data);

wfc_layer = layer_create(0);
wfc_tilemap = layer_tilemap_create(wfc_layer, 0, 0, ts_symmetry, width_tiles, height_tiles);

wave_grid = ds_grid_create(width_tiles, height_tiles);
wave_grid_copy = ds_grid_create(width_tiles, height_tiles);
done_grid = ds_grid_create(width_tiles, height_tiles);
tile_stack_x = ds_stack_create();
tile_stack_y = ds_stack_create();
var _num_tiles = ds_list_size(tile_data[? "tiles"]);

ds_grid_set_region(done_grid, 0, 0, width_tiles-1, height_tiles-1, false);

for (var i=0; i<width_tiles; i++) {
	for (var j=0; j<height_tiles; j++) {
		wave_grid[# i, j] = ds_list_create();
		wave_grid_copy[# i, j] = ds_list_create();
		for (var k=0; k<_num_tiles; k++) {
			ds_list_add(wave_grid[# i, j], k);
		}
		
		ds_list_copy(wave_grid_copy[# i, j], wave_grid[# i, j]);
	}
}

var _done = false;
var _start_time = current_time;

while (!_done) {
	_done = wfc_begin_step();
	wfc_end_step();
}

show_debug_message("Time taken: " + string((current_time - _start_time) / 1000) + " s");