/// @arg filename
var _filename = argument[0];

var _file = file_text_open_read(_filename);
var _raw_json = "";

while (!file_text_eof(_file)) {
	_raw_json += file_text_readln(_file);
}

file_text_close(_file);

var _tile_data = json_decode(_raw_json);
var _tiles = _tile_data[? "tiles"];
var _len = ds_list_size(_tiles);

/*if (!ds_map_exists(_tile_data, "weights")) {
	var _weights = ds_list_create();
	
	for (var i=0; i<_len; i++) {
		ds_list_add(_weights, 1);
	}
	
	ds_map_add_list(_tile_data, "weights", _weights);
}*/

for (var i=0; i<_len; i++) {
	var _tile = _tiles[| i];
	_tile[? "symmetry"] = ds_map_find_value(symmetry_map, _tile[? "symmetry"]);
}

return _tile_data;