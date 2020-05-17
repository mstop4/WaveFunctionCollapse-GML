width_tiles = room_width div 32;
height_tiles = room_height div 32;

test_layer = layer_create(0);
test_tilemap = layer_tilemap_create(test_layer, 0, 0, ts_test, width_tiles, height_tiles);

// 0 - none
// 1 - rotate
// 2 - flip (v)
// 3 - flip, rotate
// 4 - mirror (h)
// 5 - mirror, rotate
// 6 - mirror, flip
// 7 - mirror, flip, rotate

for (var i=0; i<2; i++) {
	for (var j=0; j<2; j++) {
		for (var k=0; k<2; k++) {
			var _x = (k + j * 2) * 2 + 1;
			var _y = i * 2 + 1;
			
			var _data = tilemap_get(test_tilemap, _x, _y);
			_data = tile_set_index(_data, 1);
			_data = tile_set_rotate(_data, k);
			_data = tile_set_flip(_data, j);
			_data = tile_set_mirror(_data, i);
			tilemap_set(test_tilemap, _data, _x, _y);
		}
	}
}
