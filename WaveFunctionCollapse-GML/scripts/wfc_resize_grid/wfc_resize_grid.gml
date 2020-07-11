/// @arg wave_grid
/// @arg width
/// @arg height

var _wave_grid = argument[0];
var _width = argument[1];
var _height = argument[2];

var _old_w = ds_grid_width(_wave_grid);
var _old_h = ds_grid_height(_wave_grid);

if (_old_w == _width && _old_h == _height) return;

for (var i=0; i<_old_w; i++) {
	for (var j=0; j<_old_h; j++) {
		ds_list_destroy(_wave_grid[# i, j]);
	}
}

ds_grid_resize(_wave_grid, _width, _height);

for (var i=0; i<_width; i++) {
	for (var j=0; j<_height; j++) {
		_wave_grid[# i, j] = ds_list_create();
	}
}