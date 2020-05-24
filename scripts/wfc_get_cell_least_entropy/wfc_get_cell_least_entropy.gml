/// @arg wave_grid

var _wave_grid = argument[0];
var _least_amount = 100000;
var _least_coords_list = ds_list_create();

for (var i=0; i<grid_width; i++) {
	for (var j=0; j<grid_height; j++) {
		if (done_grid[# i, j] == CELL_STATE.IDLE) {
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
}
var _len = ds_list_size(_least_coords_list);

if (_len == 0) return [-1, -1];

var _index = irandom_range(0, _len-1);
var _choice = _least_coords_list[| _index];
var _return = [_choice[0], _choice[1]];
ds_list_destroy(_least_coords_list);
return _return;