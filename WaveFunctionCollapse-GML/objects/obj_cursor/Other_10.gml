var _tile_data = wfc_id.tile_data[? "tiles"];
var _tile = _tile_data[| cur_tile];
var _tile_id = _tile[? "tileId"];
var _subtile = _tile_id[| cur_subtile];

tile_data = 0;
tile_data = tile_set_index(tile_data, _subtile);
tile_data = tile_set_rotate(tile_data, _tile[? "transforms"] & 1);
tile_data = tile_set_flip(tile_data, _tile[? "transforms"] & 2);
tile_data = tile_set_mirror(tile_data, _tile[? "transforms"] & 4);