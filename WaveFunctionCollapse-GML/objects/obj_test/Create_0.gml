randomise();
init_enums();
init_data();

// Settings
exclusion_list = ds_list_create();
async_mode = false;
//ds_list_add(exclusion_list, 4, 8);

// Working vars
state = WFC_STATE.IDLE;
wave_num = 0;
propagation_done = false;
start_time = 0;
step_time = 0;

error_tile_index = 7;
raw_tile_data = load_tile_json(tile_data_json);
tile_data = generate_tile_data(raw_tile_data);

wfc_layer = layer_create(0);
wfc_tilemap = layer_tilemap_create(wfc_layer, 0, 0, tileset_index, grid_width, grid_height);

wave_grid = ds_grid_create(grid_width, grid_height);				// working grid of all possible tile indexes
checked_grid = ds_grid_create(grid_width, grid_height);     // grid to keep track of which cells are checked
done_grid = ds_grid_create(grid_width, grid_height);        // grid to keep track of which cells are completely collapsed
done_queue_x = ds_queue_create();
done_queue_y = ds_queue_create();
grid_changed = true;

tile_stack_x = ds_stack_create();
tile_stack_y = ds_stack_create();

// Init wave grid
for (var i=0; i<grid_width; i++) {
	for (var j=0; j<grid_height; j++) {
		wave_grid[# i, j] = ds_list_create();
	}
}