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

for (var i=0; i<_len; i++) {
	var _tile = _tiles[| i];
	switch (_tile[? "symmetry"]) {
		case "X":
			_tile[? "symmetry"] = SYMMETRY.X;
			break;

		case "T":
			_tile[? "symmetry"] = SYMMETRY.T;
			break;
			
		case "I":
			_tile[? "symmetry"] = SYMMETRY.I;
			break;
			
		case "L":
			_tile[? "symmetry"] = SYMMETRY.L;
			break;
			
		case "Z":
			_tile[? "symmetry"] = SYMMETRY.Z;
			break;
			
		case "R":
			_tile[? "symmetry"] = SYMMETRY.R;
			break;
	}
}

return _tile_data;