init_enums();
width_tiles = room_width div 32;
height_tiles = room_height div 32;

create_test_tiles();
init_symmetries();

// dummy_tile = load_dummy_json();
// var _dummy_json = json_encode(dummy_tile);
// show_debug_message(_dummy_json);

raw_tile_data = load_tile_json("test.json");
tile_data = generate_tile_data(raw_tile_data);

wave_grid = ds_grid_create(width_tiles, height_tiles);
var _num_tiles = ds_list_size(tile_data[? "tiles"]);

for (var i=0; i<width_tiles; i++) {
	for (var j=0; j<height_tiles; j++) {
		wave_grid[# i, j] = ds_list_create();
		for (var k=0; k<_num_tiles; k++) {
			ds_list_add(wave_grid[# i, j], k);
		}
	}
}

collapse_cell(wave_grid[# 3, 4]);
var _least = get_cell_least_entropy(wave_grid);

show_debug_message(string(_least[0]) + ", " + string(_least[1]));