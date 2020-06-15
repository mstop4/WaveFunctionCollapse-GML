// Create Raw Tile UI
var _tile_data = raw_tile_data[? "tiles"];
var _len = ds_list_size(_tile_data);

var _xx = 0;
var _yy = 0;

// Create raw tile list
for (var i=0; i<_len; i++) {
	var _cur_tile = _tile_data[| i];
	var _sides = _cur_tile[? "sides"];
	
	var _tile = instance_create_layer(32 + _xx * 64, 32 + _yy * 64, raw_ui_layer, obj_editor_raw_tile);
	_tile.tile_data = tile_set_index(_tile.tile_data, _cur_tile[? "tileId"]);
	_tile.tile_index = i;
	_tile.tile_id = _cur_tile[? "tileId"];
	_tile.symmetry = _cur_tile[? "symmetry"];
	_tile.symmetry_label = ds_map
	_tile.weight = _cur_tile[? "weight"];
	_tile.editor_id = id;
	
	for (var j=0; j<4; j++) {
		var _cur_side = _sides[| j];
		var _side_group = _cur_side[? "sideGroup"];
		var _neighbours = _cur_side[? "neighbours"];
		
		var _neighbours_len = ds_list_size(_neighbours);
		
		_tile.side_groups[j] = string(_side_group);
		_tile.neighbours[j] = "";
		
		for (var k=0; k<_neighbours_len; k++) {
			_tile.neighbours[j] += string(_neighbours[| k]) + (k < _neighbours_len-1 ?  ", " : "");
		}
	}
	
	ds_list_add(raw_tile_buttons, _tile);
	
	_xx++;
	if (_xx > 7) {
		_xx = 0;
		_yy++;
	}
}

// Create exemplar tile list
for (var i=0; i<2; i++) {
	for (var j=0; j<4; j++) {
		
		var _tile = instance_create_layer(800 + j * 96, 224 + i * 96, raw_ui_layer, obj_editor_preview_tile);
		_tile.editor_id = id;
		_tile.visible = false;

		ds_list_add(exemplar_tile_previews, _tile);
	}
}