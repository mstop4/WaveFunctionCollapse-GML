init_enums();
width_tiles = 5;
height_tiles = 5;
state = WFC_STATE.IDLE;

init_data();

raw_tile_data = load_tile_json("test.json");
tile_data = generate_tile_data(raw_tile_data);

wfc_layer = layer_create(0);
wfc_tilemap = layer_tilemap_create(wfc_layer, 0, 0, ts_symmetry, width_tiles, height_tiles);

wave_grid = ds_grid_create(width_tiles, height_tiles);				// working grid of all possible tile indexes
checked_grid = ds_grid_create(width_tiles, height_tiles);     // grid to keep track of which cells are checked
done_grid = ds_grid_create(width_tiles, height_tiles);        // grid to keep track of which cells are completely collapsed
grid_changed = true;

tile_stack_x = ds_stack_create();
tile_stack_y = ds_stack_create();
var _num_tiles = ds_list_size(tile_data[? "tiles"]);

ds_grid_set_region(done_grid, 0, 0, width_tiles-1, height_tiles-1, CELL_STATE.UNCHECKED);

for (var i=0; i<width_tiles; i++) {
	for (var j=0; j<height_tiles; j++) {
		wave_grid[# i, j] = ds_list_create();
		for (var k=0; k<_num_tiles; k++) {
			ds_list_add(wave_grid[# i, j], k);
		}
	}
}