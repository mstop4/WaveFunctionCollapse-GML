/// @arg tile
/// @arg tile_data
/// @arg tile_index

var _tile = argument[0];
var _tile_data = argument[1];
var _tile_index = argument[2];
var _sides = _tile_data[? "sides"];

var _all_tiles = tile_data[? "tiles"];
var _all_tiles_len = ds_list_size(_all_tiles);

_tile.tile_id = _tile_data[? "tileId"];
_tile.tile_data = tile_set_index(_tile.tile_data, _tile.tile_id[| 0]);
_tile.tile_data = tile_set_rotate(_tile.tile_data, _tile_data[? "transforms"] & 1);
_tile.tile_data = tile_set_flip(_tile.tile_data, _tile_data[? "transforms"] & 2);
_tile.tile_data = tile_set_mirror(_tile.tile_data, _tile_data[? "transforms"] & 4);
_tile.tile_index = _tile_index;
	
for (var j=0; j<4; j++) {
	var _cur_side = _sides[| j];
	var _neighbours = _cur_side[? "neighbours"];
		
	_tile.side_groups[| j] = _cur_side[? "sideGroup"];
	_tile.neighbours[| j] = _cur_side[? "neighbours"];
	_tile.neighbours_string[| j] = side_data_to_string(_neighbours);
		
	_tile.possible_neighbours[j] = "";
	
	// Find possible neighbours
	for (var i=0; i<_all_tiles_len; i++) {
		var _nb_tile = _all_tiles[| i];
		var _nb_sides = _nb_tile[? "sides"];
		var _nb_side = _nb_sides[| opposite_neighbour[j]];
		
		if (ds_list_find_index(_nb_side[? "neighbours"], _cur_side[? "sideGroup"]) != -1
				&& ds_list_find_index(_neighbours, _nb_side[? "sideGroup"]) != -1) {
				_tile.possible_neighbours[j] += string(i) + (i < _all_tiles_len-1 ? ", " : "");
		}
	}
}