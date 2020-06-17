// Create Final Tile UI
var _tile_data = tile_data[? "tiles"];
var _len = ds_list_size(_tile_data);

var _xx = 0;
var _yy = 0;

for (var i=0; i<_len; i++) {
	var _cur_tile = _tile_data[| i];
	var _sides = _cur_tile[? "sides"];
	
	var _tile = instance_create_layer(32 + _xx * 64, 32 + _yy * 64, final_ui_layer, obj_editor_final_tile);
	_tile.tile_data = tile_set_index(_tile.tile_data, _cur_tile[? "tileId"]);
	_tile.tile_data = tile_set_rotate(_tile.tile_data, _cur_tile[? "transforms"] & 1);
	_tile.tile_data = tile_set_flip(_tile.tile_data, _cur_tile[? "transforms"] & 2);
	_tile.tile_data = tile_set_mirror(_tile.tile_data, _cur_tile[? "transforms"] & 4);
	_tile.tile_index = i;
	_tile.tile_id = _cur_tile[? "tileId"];
	_tile.editor_id = id;
	
	for (var j=0; j<4; j++) {
		var _cur_side = _sides[| j];
		var _neighbours = _cur_side[? "neighbours"];
		
		var _neighbours_len = ds_list_size(_neighbours);
		
		_tile.side_groups[| j] = _cur_side[? "sideGroup"];
		_tile.neighbours[| j] = "";
		
		for (var k=0; k<_neighbours_len; k++) {
			_tile.neighbours[| j] += string(_neighbours[| k]) + (k < _neighbours_len-1 ?  ", " : "");
		}
	}
	
	ds_list_add(final_tile_buttons, _tile);
	
	_xx++;
	if (_xx > 7) {
		_xx = 0;
		_yy++;
	}
}