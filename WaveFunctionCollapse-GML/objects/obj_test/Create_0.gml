init_data();
window_set_size(room_width, room_height);
surface_resize(application_surface, room_width, room_height);

raw_tile_data = -1;
tile_data = -1;
load_tile_data();

// Settings
exclusion_list = ds_list_create();
// ds_list_add(exclusion_list, 14);
async_mode = false;

// Working vars
state = WFC_STATE.IDLE;
wave_num = 0;
propagation_done = false;
start_time = 0;
step_time = 0;
get_seed_sync = -1;
get_seed_async = -1;

// error debugging
errored = false;
last_collapse_x = -1;
last_collapse_y = -1;
last_collapse_tile_id = -1;
last_collapse_tile_data = 0;

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

/*var _cursor = instance_create_layer(0, 0, "Instances", obj_cursor);
var _tiles = tile_data[? "tiles"];

_cursor.wfc_id = id;
_cursor.num_tiles = ds_list_size(_tiles);
with (_cursor) {
	event_user(0);
}*/