/// @arg wave_grid

var _wave_grid = argument[0];
var _least_amount = 100000;
var _least_coords_list = ds_list_create();

for (var i=0; i<width_tiles; i++) {
	for (var j=0; j<height_tiles; j++) {
		var _len = ds_list_size(_wave_grid[# i, j]);
		if (_len <= _least_amount) {
			if (_len < _least_amount) {
				_least_amount = _len;
				ds_list_clear(_least_coords_list);
			}
			ds_list_add(_least_coords_list, [i, j]);
		}
	}
}
var _index = irandom_range(0, ds_list_size(_least_coords_list));
var _choice = _least_coords_list[| _index];
var _return = [_choice[0], _choice[1]];
ds_list_destroy(_least_coords_list);
return _return;