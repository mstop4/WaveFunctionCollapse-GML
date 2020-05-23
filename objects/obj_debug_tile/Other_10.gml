/// @description Insert description here
// You can write your code in this editor

var _data = tilemap_get_at_pixel(tilemap_id, x, y);
_data = tile_set_index(_data, tile_id);
_data = tile_set_rotate(_data, transforms & 1);
_data = tile_set_flip(_data, transforms & 2);
_data = tile_set_mirror(_data, transforms & 4);
tilemap_set_at_pixel(tilemap_id, _data, x, y);