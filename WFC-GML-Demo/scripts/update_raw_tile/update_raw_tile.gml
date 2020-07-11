/// @arg tile
/// @arg tile_data
/// @arg tile_index

var _tile = argument[0];
var _tile_data = argument[1];
var _tile_index = argument[2];
var _sides = _tile_data[? "sides"];

_tile.tile_index = _tile_index;
_tile.tile_id = _tile_data[? "tileId"];
_tile.tile_data = tile_set_index(_tile.tile_data, _tile.tile_id[| 0]);
_tile.symmetry = _tile_data[? "symmetry"];
_tile.symmetry_label = ds_map_find_key(symmetry_map, _tile_data[? "symmetry"]);
_tile.weight = _tile_data[? "weight"];
	
for (var j=0; j<4; j++) {
	var _cur_side = _sides[| j];
	var _neighbours = _cur_side[? "neighbours"];
		
	_tile.side_groups[| j] = _cur_side[? "sideGroup"];
	_tile.neighbours[| j] = _cur_side[? "neighbours"];
	_tile.neighbours_string[| j] = side_data_to_string(_neighbours);
}