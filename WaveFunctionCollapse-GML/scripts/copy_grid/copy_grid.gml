/// @arg source_grid
/// @arg dest_grid
function copy_grid() {
	// Makes deep copy of grid of lists

	var _source_grid = argument[0];
	var _dest_grid = argument[1];

	var _w = min(ds_grid_width(_source_grid), ds_grid_width(_dest_grid));
	var _h = min(ds_grid_height(_source_grid), ds_grid_height(_dest_grid));

	for (var i=0; i<_w; i++) {
		for (var j=0; j<_h; j++) {
			ds_list_copy(_dest_grid[# i, j], _source_grid[# i, j]);
		}
	}


}
