init_enums();
init_data();

raw_tile_data = load_tile_json(tile_data_json);
tile_data = generate_tile_data(raw_tile_data, false);

debug_layer = layer_create(0);
debug_tilemap = layer_tilemap_create(debug_layer, 0, 0, tileset_index, width_tiles, height_tiles);

var _tile_data = tile_data[? "tiles"];
var _len = ds_list_size(_tile_data);

for (var i=0; i<_len; i++) {
	var _cur_tile = _tile_data[|
}