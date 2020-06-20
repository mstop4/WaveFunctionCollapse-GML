// Create Final Tile UI
var _tile_data = tile_data[? "tiles"];
var _len = ds_list_size(_tile_data);

var _xx = 0;
var _yy = 0;

for (var i=0; i<_len; i++) {
	var _cur_tile = _tile_data[| i];
	
	var _tile = instance_create_layer(32 + _xx * 64, 32 + _yy * 64, final_ui_layer, obj_editor_final_tile);
	_tile.editor_id = id;
	update_final_tile(_tile, _cur_tile, i);
	
	ds_list_add(final_tile_buttons, _tile);
	
	_xx++;
	if (_xx > 7) {
		_xx = 0;
		_yy++;
	}
}