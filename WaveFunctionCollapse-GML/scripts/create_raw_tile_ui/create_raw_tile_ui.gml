// Create Raw Tile UI
var _tile_data = raw_tile_data[? "tiles"];
var _len = ds_list_size(_tile_data);

var _xx = 0;
var _yy = 0;

// Create raw tile list
for (var i=0; i<_len; i++) {
	var _cur_tile = _tile_data[| i];
	
	var _tile = instance_create_layer(32 + _xx * 64, 32 + _yy * 64, raw_ui_layer, obj_editor_raw_tile);
	_tile.editor_id = id;
	update_raw_tile(_tile, _cur_tile, i);
	
	ds_list_add(raw_tile_buttons, _tile);
	
	_xx++;
	if (_xx > 7) {
		_xx = 0;
		_yy++;
	}
}

// Create transformed tile list
for (var i=0; i<2; i++) {
	for (var j=0; j<4; j++) {
		
		var _tile = instance_create_layer(800 + j * 96, 224 + i * 96, raw_ui_layer, obj_editor_preview_tile);
		_tile.editor_id = id;
		_tile.visible = false;

		ds_list_add(exemplar_tile_previews, _tile);
	}
}

// Create edit side buttons
for (var i=0; i<4; i++) {
	var _side_offsets = side_data_offsets[i];
	var _button = instance_create_layer(944 + _side_offsets[0], 128 + _side_offsets[1], raw_ui_layer, obj_editor_edit_side_button);
	_button.side_index = i;
	_button.editor_id = id;
}