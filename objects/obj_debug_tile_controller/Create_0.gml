init_enums();
init_data();

width_tiles = 30;
height_tiles = 24;
draw_mode = 0;

exclusion_list = ds_list_create();
ds_list_add(exclusion_list, 1, 6);

raw_tile_data = load_tile_json(tile_data_json);
tile_data = generate_tile_data(raw_tile_data, false);

debug_layer = layer_create(0);
debug_tilemap = layer_tilemap_create(debug_layer, 0, 0, tileset_index, width_tiles, height_tiles);

var _tile_data = tile_data[? "tiles"];
var _len = ds_list_size(_tile_data);

var _xx = 0;
var _yy = 0;

for (var i=0; i<_len; i++) {
	var _cur_tile = _tile_data[| i];
	var _sides = _cur_tile[? "sides"];
	
	var _d_tile = instance_create_layer(32 + _xx * 64, 32 + _yy * 64, "Instances", obj_debug_tile);
	_d_tile.tilemap_id = debug_tilemap;
	_d_tile.tile_id = _cur_tile[? "tileId"];
	_d_tile.transforms = _cur_tile[? "transforms"];
	
	for (var j=0; j<4; j++) {
		var _cur_side = _sides[| j];
		var _side_groups = _cur_side[? "sideGroups"];
		var _neighbours = _cur_side[? "neighbours"];
		
		var _side_groups_len = ds_list_size(_side_groups);
		var _neighbours_len = ds_list_size(_neighbours);
		
		_d_tile.side_groups[j] = "";
		_d_tile.neighbours[j] = "";
		
		for (var k=0; k<_side_groups_len; k++) {
			_d_tile.side_groups[j] += string(_side_groups[| k]) + ", ";
		}
		
		for (var k=0; k<_neighbours_len; k++) {
			_d_tile.neighbours[j] = string(_neighbours[| k]) + ", ";
		}
	}
	
	_xx++;
	if (_xx > 8) {
		_xx = 0;
		_yy++;
	}
}

with (obj_debug_tile) event_user(0);