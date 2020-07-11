errored = false;

// Update grid attributes if tile size has changed
var _old_w = grid_width;
var _old_h = grid_height;
grid_width = ceil((room_width - tilemap_offset_x) / tile_width);
grid_height = ceil((room_height - tilemap_offset_y) / tile_height);

tilemap_tileset(wfc_tilemap, tileset_index);

if (_old_w != grid_width || _old_h != grid_height) {
	show_debug_message("Resizing tilemap to " + string(grid_width) + "x" + string(grid_height));
	tilemap_set_width(wfc_tilemap, grid_width);
	tilemap_set_height(wfc_tilemap, grid_height);
	wfc_resize_grid(wave_grid, grid_width, grid_height);
	ds_grid_resize(checked_grid, grid_width, grid_height);
	ds_grid_resize(done_grid, grid_width, grid_height);
	max_progress = grid_width * grid_height;
}

tilemap_clear(wfc_tilemap, 0);

ds_grid_clear(done_grid, CELL_STATE.IDLE);
ds_grid_clear(checked_grid, CELL_STATE.IDLE);

ds_queue_clear(done_queue_x);
ds_queue_clear(done_queue_y);
ds_stack_clear(tile_stack_x);
ds_stack_clear(tile_stack_y);
progress = 0;
time_taken = "";
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

var _base_choices_len = ds_list_size(_base_choices);
if (_base_choices_len == 0) {
	show_message_async("No tiles available to use!");
	return false;
}

for (var i=0; i<grid_width; i++) {
	for (var j=0; j<grid_height; j++) {
		ds_list_copy(wave_grid[# i, j], _base_choices);
	}
}

ds_list_destroy(_base_choices);

return true;