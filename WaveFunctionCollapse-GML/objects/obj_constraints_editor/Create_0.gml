init_data();
raw_tile_data = -1;
tile_data = -1;
load_tile_data();

side_mode = 0;
cur_edited_tile = noone;
side_data_offsets[SIDE.TOP] = [16, -16];
side_data_offsets[SIDE.BOTTOM] = [16, 32];
side_data_offsets[SIDE.LEFT] = [-16, 0];
side_data_offsets[SIDE.RIGHT] = [48, 0];

var _tile_data = tile_data[? "tiles"];
var _len = ds_list_size(_tile_data);

var _side_mode_button = instance_create_layer(800, 32, "Instances", obj_editor_side_mode_button);
_side_mode_button.editor_id = id;

var _xx = 0;
var _yy = 0;

for (var i=0; i<_len; i++) {
	var _cur_tile = _tile_data[| i];
	var _sides = _cur_tile[? "sides"];
	
	var _tile = instance_create_layer(32 + _xx * 64, 32 + _yy * 64, "Instances", obj_editor_tile);
	_tile.tile_data = tile_set_index(_tile.tile_data, _cur_tile[? "tileId"]);
	_tile.tile_data = tile_set_rotate(_tile.tile_data, _cur_tile[? "transforms"] & 1);
	_tile.tile_data = tile_set_flip(_tile.tile_data, _cur_tile[? "transforms"] & 2);
	_tile.tile_data = tile_set_mirror(_tile.tile_data, _cur_tile[? "transforms"] & 4);
	_tile.tileset_index = tileset_index;
	_tile.tile_index = i;
	_tile.tile_id = _cur_tile[? "tileId"];
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
	
	_xx++;
	if (_xx > 7) {
		_xx = 0;
		_yy++;
	}
}

	draw_set_font(fnt_default);